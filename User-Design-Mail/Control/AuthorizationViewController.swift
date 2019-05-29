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
  
  
  @IBOutlet weak var emailTF: UITextField!
  @IBOutlet weak var passwordTF: UITextField!
  
  var isSingedIn = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(kbDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)

    NotificationCenter.default.addObserver(self, selector: #selector(kbDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
  }
  
  
   @objc func kbDidShow(notification: Notification) {
    guard let userInfo = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] else { return }
    let kbFrameSize = (userInfo as! NSValue).cgRectValue
    
    (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height + kbFrameSize.height)
    
  }
  
   @objc func kbDidHide() {
     (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    
  }
  
  
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
          
      emailTF.text = ""
      passwordTF.text = ""
  }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
  

  @IBAction func logInButton(_ sender: UIButton) {
    
    if let email = emailTF.text, let password = passwordTF.text {
    if isSingedIn {
      Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
    
      if user != nil {
        self?.performSegue(withIdentifier: "toTasksSegue", sender: nil)
      } else {
        self?.alertMessage(title: "Caution!", message: "Wrong email or password, please try again", style: .alert)
      }
    }
  }
}
  

  }
 
}
