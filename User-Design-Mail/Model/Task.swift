//
//  Task.swift
//  User-Design-Mail
//
//  Created by Alexander Skrypnyk on 5/29/19.
//  Copyright © 2019 skrypnyk. All rights reserved.
//

import Foundation
import Firebase

struct Task {
    
    let title: String
    let userID: String
    let ref: DatabaseReference?
    var completed: Bool = false
    
    init(title: String, userID: String) {
        self.title = title
        self.userID = userID
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as! String
        userID = snapshotValue["userID"] as! String
        completed = snapshotValue["completed"] as! Bool
        ref = snapshot.ref
    }
}
