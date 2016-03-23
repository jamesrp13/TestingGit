//
//  Message.swift
//  TestingGit
//
//  Created by James Pacheco on 3/23/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

class Message: FirebaseType {
    let text: String
    let sender: String
    let group: String
    
    var identifier: String?
    var endpoint: String {
        return "Messages"
    }
    var jsonValue: [String: AnyObject] {
        return ["sender": sender, "text": text, "group": group]
    }
    
    init(text: String, sender: String, group: String) {
        self.text = text
        self.sender = sender
        self.group = group
    }
}