//
//  ViewController.swift
//  SideMenu
//
//  Created by Apple on 11/20/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import LGSideMenuController

class ViewController: UIViewController {

    
    @IBOutlet var lblHome: UILabel!
    
    @IBOutlet var btnEnglish: UIButton!
    
    @IBOutlet var btnHindi: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("NotificationIdentifier"), object: nil)
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "LeftMenu"), style: .plain, target: self, action: #selector(showMenu))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblHome.text = Singleton.localizedLocalString(forKey: "Home")
        navigationItem.title = Singleton.localizedLocalString(forKey: "Home")
    }

    @objc func showMenu()  {
        sideMenuController?.showLeftView(animated: true, completionHandler: nil)
    }
    
    
    @IBAction func btnHindiClick(_ sender: Any) {
        UserDefaults.standard.set("hi", forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil)
    }
    
    @IBAction func btnEnglishClick(_ sender: Any) {
        UserDefaults.standard.set("en", forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil)
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
        lblHome.text = Singleton.localizedLocalString(forKey: "Home")
        navigationItem.title = Singleton.localizedLocalString(forKey: "Home")
        
    }
}

