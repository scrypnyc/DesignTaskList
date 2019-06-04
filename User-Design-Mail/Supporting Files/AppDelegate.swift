//
//  AppDelegate.swift
//  User-Design-Mail
//
//  Created by Alexander Skrypnyk on 5/16/19.
//  Copyright © 2019 skrypnyk. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    sleep(1)
    
    FirebaseApp.configure()
//    checkUserLogin()
    return true
  }


//    extension AppDelegate {
//
//    func checkUserLogin() {
//            // to check whether the user has already logged in or not
//
//
//        SVProgressHUD.show()
//        Auth.auth().addStateDidChangeListener { (auth, user) in
//
//            if user == nil {
//                SVProgressHUD.dismiss()
//                self.MainVC()
//                } else {
//                SVProgressHUD.dismiss()
//                self.TasksVC()
//                }
//
//                // if user is not nil then automatically go to maintab bar (initialVC is indeed main tab bar controller)
//                SVProgressHUD.dismiss()
//            }
//        }
//
//        func MainVC () {
//            let storyboard = UIStoryboard(name: "MainViewController", bundle: nil)
//            let main = storyboard.instantiateViewController(withIdentifier: "AuthVC")
//            window?.rootViewController = main
//
//        }
//
//        func TasksVC () {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let login = storyboard.instantiateViewController(withIdentifier: "MainVC")
//            window?.rootViewController = login
//
//        }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  func applicationDidFinishLaunching(_ application: UIApplication) {
    
    }

}

