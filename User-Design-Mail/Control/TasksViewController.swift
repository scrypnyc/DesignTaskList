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

    var user: UserData!
    var ref: DatabaseReference!
    var tasks = Array<Task>()
    
  @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    guard let currentUser = Auth.auth().currentUser else { return }
        user = UserData(user: currentUser)
        ref = Database.database().reference(withPath: "user").child(String(user.uid)).child("tasks")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // to fetch data
        ref.observe(.value, with: { [weak self] snapshot in
        var tasks = Array<Task>()
        for item in snapshot.children {
        let task = Task(snapshot: item as! DataSnapshot)
            tasks.append(task)
        }
        self?.tasks = tasks
        self?.tableView.reloadData()
        })
    }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let bgColorView = UIView()
        bgColorView.backgroundColor = .init(red: 0.14, green: 0.26, blue: 0.33, alpha: 1.0)
        cell.selectedBackgroundView = bgColorView
        cell.textLabel?.textColor = .white
    
    let taskTitle = tasks[indexPath.row].title
        cell.textLabel?.text = taskTitle
    
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
  }  
  
  
  @IBAction func addTaped(_ sender: UIBarButtonItem) {
    
    let alertController = UIAlertController(title: "New Task", message: "Enter text", preferredStyle: .alert)
        alertController.addTextField()
    let save = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
        
    guard let textField = alertController.textFields?.first, textField.text != "" else { return }
    let task = Task(title: textField.text!, userid: (self?.user.uid)!)
    let taskRef = self?.ref.child(task.title)
    // add dictionary
        taskRef?.setValue(task.convertToDictionary())
    }
    
    // AlertAction
    let candel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(save)
        alertController.addAction(candel)
    
    present(alertController, animated: true, completion: nil)
  }
  
  
  @IBAction func signOutButton(_ sender: UIBarButtonItem) {
    
    do {
        // SignOut to auth VC
        try Auth.auth().signOut()
    } catch {
      print(error.localizedDescription)
    }
      dismiss(animated: true, completion: nil)
  }
}

