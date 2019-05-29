//
//  User.swift
//  User-Design-Mail
//
//  Created by Alexander Skrypnyk on 5/29/19.
//  Copyright © 2019 skrypnyk. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    let uID: String
    let email: String
    
    init(user: User) {
        self.uID = user.uID
        self.email = user.email
    }
}
