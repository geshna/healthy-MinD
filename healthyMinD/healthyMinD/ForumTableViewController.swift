//
//  ForumTableViewController.swift
//  healthyMinD
//
//  Created by Sanjeev Aggarwal on 12/6/20.
//

import UIKit
import Firebase

class ForumTableViewController: UITableViewController {
    
    var db:Firestore!
    
    var postArray = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.delegate = self
        //tableView.dataSource = self
        
        db = Firestore.firestore()
        loadData()
        checkForUpdates()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func loadData(){
        db.collection("posts").getDocuments() {
            QuerySnapshot, error in
            if let error = error {
                print("\(error.localizedDescription)")
            }else{
                self.postArray = QuerySnapshot!.documents.compactMap({Post(dictionary: $0.data())})
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func checkForUpdates() {
        db.collection("posts").whereField("timeStamp", isGreaterThan: Date())
            .addSnapshotListener {
                QuerySnapshot, error in
                
                guard let snapshot = QuerySnapshot else {return}
                
                snapshot.documentChanges.forEach {
                    diff in
                    
                    if diff.type == .added {
                        self.postArray.append(Post(dictionary: diff.document.data())!)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
        }
    }

    @IBAction func composePost(_ sender: Any) {
   
        let composeAlert = UIAlertController(title: "New Post", message: "Enter your name and message", preferredStyle: .alert)
        composeAlert.addTextField { (textField:UITextField) in
            textField.placeholder = "Your name"
        }
        composeAlert.addTextField { (textField:UITextField) in
            textField.placeholder = "Your message"
        }
        
        composeAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        composeAlert.addAction(UIAlertAction(title: "Send", style: .default, handler:
            {(action:UIAlertAction) in
                
                if let name = composeAlert.textFields?.first?.text, let content = composeAlert.textFields?.last?.text {
                    
                    let newPost = Post(name: name, content: content, timeStamp: Date())
                    
                    var ref:DocumentReference? = nil
                    ref = self.db.collection("posts").addDocument(data: newPost.dictionary) {
                        error in
                        
                        if let error = error {
                            print("Error adding document: \(error.localizedDescription)")
                        }else{
                            print("Document added with ID: \(ref!.documentID)")
                        }
                    }
                    
                }
                
        }))
        
        self.present(composeAlert, animated: true, completion: nil)
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forumCell", for: indexPath)

        let post = postArray[indexPath.row]
        
        cell.textLabel?.text = "\(post.name): \(post.content)"
        cell.detailTextLabel?.text = "\(post.timeStamp)"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
