//
//  ViewController.swift
//  TestingGit
//
//  Created by James Pacheco on 3/23/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var textForMessageTextField: UITextField!
    
    @IBOutlet weak var groupTextField: UITextField!
    
    let name = "James"
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        FirebasePractice.fetchMessagesForGroup("Chinese") { (message) in
            self.messages.append(message)
            self.tableView.reloadData()
        }
    }

    @IBAction func sendMessageTapped(sender: AnyObject) {
        FirebasePractice.createMessage(name, text: textForMessageTextField.text!, group: groupTextField.text!)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell")!
        let message = messages[indexPath.row]
        cell.textLabel?.text = "\(message.sender): \(message.text)"
        return cell
    }


}

