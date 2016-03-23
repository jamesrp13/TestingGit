//
//  PushingToFirebase.swift
//  TestingGit
//
//  Created by James Pacheco on 3/23/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation
import Firebase

let base = Firebase(url: "learningtousefirebas.firebaseIO.com")
let messageEndpoint = "Messages"


class FirebasePractice {
    
    static func createMessage(sender: String, text: String, group: String) {
//        let dictionary: [String: AnyObject] = ["sender": sender, "text": text, "group": group]
        var message = Message(text: text, sender: sender, group: group)
        message.save()
//        base.childByAppendingPath(messageEndpoint).childByAutoId().setValue(dictionary)
    }
    
    static func fetchMessagesForGroup(group: String, completion: (message: Message)->Void) {
        base.childByAppendingPath("Messages").queryOrderedByChild("group").queryEqualToValue(group).observeEventType(.ChildAdded, withBlock: { (data) in
            if let value = data.value as? [String: AnyObject] {
                let message = Message(text: value["text"] as! String, sender: value["sender"] as! String, group: value["group"] as! String)
                completion(message: message)
            }
        })
    }

}