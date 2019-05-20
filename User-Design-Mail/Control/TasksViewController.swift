//
//  TasksViewController.swift
//  User-Design-Mail
//
//  Created by Alexander Skrypnyk on 5/18/19.
//  Copyright © 2019 skrypnyk. All rights reserved.
//

import UIKit
import Firebase

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let bgColorView = UIView()
    bgColorView.backgroundColor = .init(red: 0.14, green: 0.26, blue: 0.33, alpha: 1.0)
    cell.selectedBackgroundView = bgColorView
    
    cell.textLabel?.text = "Cell number \(indexPath.row)"
    cell.textLabel?.textColor = .white
    
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  
  @IBAction func addTaped(_ sender: UIBarButtonItem) {
  }
  
  @IBAction func signOutButton(_ sender: UIBarButtonItem) {
    do {
        try Auth.auth().signOut()
    } catch {
      print(error.localizedDescription)
    }
    dismiss(animated: true, completion: nil)
  }
}

