//
//  LoginViewController.swift
//  SideMenu
//
//  Created by Apple on 11/27/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func loginClick(_ sender: Any) {
        let kUserDefault = UserDefaults.standard
        kUserDefault.set(true, forKey: "isCheck")
        kUserDefault.synchronize()
        
        let homeVC = ViewController()
        
        navigationController?.pushViewController(homeVC, animated: true)
        
    }
    
}
