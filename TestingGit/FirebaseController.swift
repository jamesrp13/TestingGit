//
//  FirebaseController.swift
//  TestingGit
//
//  Created by James Pacheco on 3/23/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    static let base = Firebase(url: "learningtousefirebas.firebaseIO.com")
}

protocol FirebaseType {
    var identifier: String? {get set}
    var endpoint: String {get}
    var jsonValue: [String: AnyObject] {get}
    mutating func save()
    func delete()
}

extension FirebaseType {
    mutating func save() {
        var newEndpoint: Firebase
        if let identifier = identifier {
            newEndpoint = FirebaseController.base.childByAppendingPath(endpoint).childByAppendingPath(identifier)
        } else {
            newEndpoint = FirebaseController.base.childByAppendingPath(endpoint).childByAutoId()
            self.identifier = newEndpoint.key
        }
        newEndpoint.updateChildValues(jsonValue)
    }
    
    func delete() {
        if let identifier = identifier {
            FirebaseController.base.childByAppendingPath(endpoint).childByAppendingPath(identifier).removeValue()
        }
    }
}