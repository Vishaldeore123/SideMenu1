//
//  Singleton.swift
//  NewSwiftDemo
//
//  Created by  on 16/04/18.
//  Copyright © 2018 vp. All rights reserved.
//bhjhjjh

import UIKit
import Foundation
import LGSideMenuController

class Singleton {

    static let sharedInstance = Singleton()
    
    //MARK:- Check Email is valid or not
    func validateEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    func isPasswordValid(password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    //  MARK:- check name or surname is valid or not
   func isValidNameOrSurname(Input:String) -> Bool {
        let RegEx = "\\A\\w{7,18}\\z"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: Input)
    }
    
    //MARK:- check current password is same with the confirm password or not
  public func isPasswordSame(password: String , confirmPassword : String) -> Bool {
        if password == confirmPassword{
            return true
        }else{
            return false
        }
    }
    
    //MARK:- Check current password length is same with confirm password length or not
    func isPwdLenth(password: String , confirmPassword : String) -> Bool {
        if password.count <= 7 && confirmPassword.count <= 7{
            return true
        }else{
            return false
        }
    }
    
    //MARK:- check pin code is valid or not
    func isValidPincode(value: String) -> Bool {
        if value.count == 6{
            return true
        }
        else{
            return false
        }
    }
    
    //MARK:- check mobile number is valid or not
    public func validMobileNumber(inputString: String?) -> Bool {
        if (inputString?.count ?? 0) < 10 || (inputString?.count ?? 0) > 13 {
            return false
        }
        let ACCEPTABLE_CHARECTERS = "0123456789()-+"
        let cs = CharacterSet(charactersIn: ACCEPTABLE_CHARECTERS).inverted
        let filtered = inputString?.components(separatedBy: cs).joined(separator: "")
        return inputString == filtered
    }
    
    //MARK:- Alert Message with title
    public func ShowAlert(title: String, message: String, in vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    //MARK:- To get Device ID
    public func getDeviceID() -> String{
        
        let deviceUUID: String = (UIDevice.current.identifierForVendor?.uuidString)!
        return deviceUUID
    }
    
    //MARK:- Retrieve value from NSUserDefaultValue
    func getNSUserDefaultValue(strKey: String) -> String {
        let strValue = UserDefaults.standard.value(forKey: strKey) as? String
        return strValue!
    }

    //MARK:- save value into NSUserDefaultValue
    func saveNSUserDefaultValue(strKey: String, value: String) {
        UserDefaults.standard.setValue(value, forKey: strKey)
        UserDefaults.standard.synchronize()
    }
    
    func getBackButton(forNavigation navgation: UINavigationController?) -> UIBarButtonItem? {
        let backButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: navgation, action: #selector(UINavigationController.popViewController(animated:)))
        return backButton
    }
    
    func getHomeButton(forViewController viewcontroller: UIViewController?) -> UIBarButtonItem? {

        let homeButton = UIBarButtonItem(image: UIImage(named: "LeftMenu"), style: .plain, target: viewcontroller, action: #selector(showMenu(sender:)))
        return homeButton
    }
    
    
    @objc func showMenu(sender: UIBarButtonItem)  {
        
        print("menu click")
//        let sideMenucontroller = LGSideMenuController()
//        sideMenucontroller.showLeftView(animated: true, completionHandler: nil)
    }
    
    func getAppDelegateInstance () -> AppDelegate
    {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    class func localizedLocalString(forKey key: String?) -> String? {
        
        var localizationBundle: Bundle?
        var langCode = ""
        
        if (langCode == "") {
            
            let prefs = UserDefaults.standard
            langCode = prefs.string(forKey: "AppleLanguages") ?? ""
        }
        
        // path to this languages bundle
        let langugageBundlepath = Bundle.main.path(forResource: langCode, ofType: "lproj")
        
        if langugageBundlepath == nil {
            // there is no bundle for that language(new language) use main bundle instead
            localizationBundle = Bundle.main
        } else {
            
            localizationBundle = Bundle(path: langugageBundlepath ?? "")
            if localizationBundle == nil {
                localizationBundle = Bundle.main
            }
        }
        
        return localizationBundle?.localizedString(forKey: key ?? "", value: "", table: nil)
    }

    
    
}

// http://iosrevisited.blogspot.in/2017/10/convert-date-string-swift4.html

extension Date
{
    //MARK:- convert date to string with required format
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

extension String
{
    //MARK:- convert string to date with required format
    func toDate( dateFormat format  : String) -> Date
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        return dateFormatter.date(from: self)!
    }
    
}

extension UIImage
{
    //MARK:- convenience function in UIImage extension to resize a given image
    func convert(toSize size:CGSize, scale:CGFloat) ->UIImage
    {
        let imgRect = CGRect(origin: CGPoint(x:0.0, y:0.0), size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        self.draw(in: imgRect)
        let copied = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return copied!
    }
}

