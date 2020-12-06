//
//  Post.swift
//  healthyMinD
//
//  Created by Sanjeev Aggarwal on 12/6/20.
//

import Foundation
import Firebase

protocol DocumentSerializable {
    init?(dictionary:[String:Any])
}

struct Post{
    var name:String
    var content:String
    var timeStamp:Date
    
    var dictionary:[String:Any] {
        return [
            "name":name,
            "content":content,
            "timeStamp":timeStamp
        ]
    }
}

extension Post : DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let name = dictionary["name"] as? String,
            let content = dictionary["content"] as? String else {return nil}
        
        let timestamp = dictionary["timeStamp"] as! Timestamp
        
        
        self.init(name: name, content: content, timeStamp: Date(timeIntervalSince1970: TimeInterval(timestamp.seconds)))
    }
}
