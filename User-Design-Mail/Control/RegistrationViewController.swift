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
  }

 
  @IBAction func singInButton(_ sender: UIButton) {
    
      guard let email = emailTF.text, let password = passwordTF.text, let confirmPassword = confirmPasswordTF.text, email != "", password == confirmPassword else {
      self.alertMessage(title: "Wrong!", message: "Wrong email or password, please try again", style: .alert)
      return
  }
    
    
  Auth.auth().createUser(withEmail: email, password: password) { [weak self] (user, error) in
    
      if user != nil {
      self?.performSegue(withIdentifier: "toLoginSegue", sender: nil)
      self?.alertMessage(title: "Wrong!", message: "Wrong email or password, please try again", style: .alert)
      return
    }
  }
}
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
}
