//
//  User.swift
//  User-Design-Mail
//
//  Created by Alexander Skrypnyk on 5/29/19.
//  Copyright © 2019 skrypnyk. All rights reserved.
//

import Foundation
import Firebase

struct UserData {
    
    let uid: String
    let email: String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email!
    }
}
