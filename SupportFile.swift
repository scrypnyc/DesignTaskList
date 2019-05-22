//
//  SupportFile.swift
//  
//
//  Created by Alexander Skrypnyk on 5/22/19.
//

import UIKit

extension UIViewController {
  
  func alertMessage(title: String, message: String, style: UIAlertController.Style) {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Enter", style: .cancel) { (action) in }
    
    alertController.addAction(action)
    self.present(alertController, animated: true, completion: nil)
  }
}
