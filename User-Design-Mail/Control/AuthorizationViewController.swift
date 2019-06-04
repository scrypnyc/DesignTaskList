//
//  AuthorizationViewController.swift
//  User-Design-Mail
//
//  Created by Alexander Skrypnyk on 5/16/19.
//  Copyright © 2019 skrypnyk. All rights reserved.
//

import UIKit
import Firebase

class AuthorizationViewController: UIViewController {
  
    var ref: DatabaseReference!

  @IBOutlet weak var emailTF: UITextField!
  @IBOutlet weak var passwordTF: UITextField!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    ref = Database.database().reference(withPath: "users")

    // set keyboard
            NotificationCenter.default.addObserver(self, selector: #selector(kbDidShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(kbDidHide), name: UIResponder.keyboardWillHideNotification, object: nil)
  }

    // set keyboard
   @objc func kbDidShow(notification: Notification) {
    guard let userInfo = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] else { return }
    let kbFrameSize = (userInfo as! NSValue).cgRectValue
    
    // added scrollView
    (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height + kbFrameSize.height)
    
  }
   @objc func kbDidHide() {
     (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
  }
  
  
//    override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//          
//      emailTF.text = ""
//      passwordTF.text = ""
//  }

  @IBAction func logInButton(_ sender: UIButton) {
    
    guard let email = emailTF.text, let password = passwordTF.text, email != "", password != ""  else {
    self.alertMessage(title: "Caution!", message: "Wrong email or password, please try again", style: .alert)
    return
    }
    
    // auth the user with Firebase
    Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
        if user != nil {
            self?.performSegue(withIdentifier: "toTasksSegue", sender: nil)
        } else {
            self?.alertMessage(title: "Caution!", message: "Wrong email or password, please try again", style: .alert)
    return
    }
            
        // email user in log database
        let userRef = self?.ref.child((user?.user.uid)!)
        userRef?.setValue(["email": user?.user.email])
    }
  }
}
 

