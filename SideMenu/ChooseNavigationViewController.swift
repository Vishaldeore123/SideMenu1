//
//  ChooseNavigationViewController.swift
//  SideMenu
//
//  Created by Apple on 11/21/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ChooseNavigationViewController: UINavigationController {

    init() {
        let kUserDefault = UserDefaults.standard
        if (kUserDefault.bool(forKey: "isCheck")) {
            
            let viewController = ViewController()
            
            super.init(rootViewController: viewController)
        }else{
            
            let loginVC = LoginViewController()
            super.init(rootViewController: loginVC)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
