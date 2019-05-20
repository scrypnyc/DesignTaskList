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
  
        override func viewDidLoad() {
          super.viewDidLoad()
      }
  
        
  
        override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          
          emailTF.text = ""
          passwordTF.text = ""
      }
  
  
      func alertMessage(title: String, message: String, style: UIAlertController.Style) {
    
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Enter", style: .cancel) { (action) in }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
      }
  
      @IBAction func logInButton(_ sender: UIButton) {
        guard let email = emailTF.text, let password = passwordTF.text, email != "", password != "" else {
        self.alertMessage(title: "Wrong!", message: "Wrong email or password, please try again", style: .alert)
      return
      }
    
      Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
        if user != nil {
        self?.performSegue(withIdentifier: "toTasksSegue", sender: nil)
      } else {
        self?.alertMessage(title: "Wrong!", message: "Wrong email or password, please try again", style: .alert)
      }
    }
  }
  
      override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
      }
}
