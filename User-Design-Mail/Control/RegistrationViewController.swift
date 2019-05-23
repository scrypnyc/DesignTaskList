//
//  RegistrationViewController.swift
//  User-Design-Mail
//
//  Created by Alexander Skrypnyk on 5/16/19.
//  Copyright © 2019 skrypnyk. All rights reserved.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {
  

  @IBOutlet weak var emailTF: UITextField!
  @IBOutlet weak var passwordTF: UITextField!
  @IBOutlet weak var confirmPasswordTF: UITextField!
  
  
  
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

 
  @IBAction func singInButton(_ sender: UIButton) {
    
    guard let email = emailTF.text,
      let password = passwordTF.text,
      let confirmPassword = confirmPasswordTF.text, email != "", password == confirmPassword else {
        self.alertMessage(title: "Caution!", message: "Wrong email or password, please try again", style: .alert)
        return
  }
    
    //register the user with Firebase
  Auth.auth().createUser(withEmail: email, password: password) { [weak self] (user, error) in
    //check user not nil
      if user != nil {
        self?.performSegue(withIdentifier: "toLoginSegue", sender: nil)
        self?.alertMessage(title: "Caution!", message: "Wrong email or password, please try again", style: .alert)
      return
    }
  }
}
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
}
