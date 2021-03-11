//
//  AppLibrary.swift
//  HammerSystemsTest
//
//  Created by Angelina on 04.02.2021.
//

import UIKit

class AppLibrary: NSObject {
    
    private static var sharedManager: AppLibrary = {
        let appLibrary = AppLibrary()
        return appLibrary
    }()
    
    func showMessage(_ message: String, _ title: String = "") {
        let errorAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        if let vc = UIApplication.shared.keyWindow!.rootViewController {
            vc.present(errorAlert, animated: true, completion: nil)
        }
    }
    
    func showErrorMessage(_ message: String) {
        showMessage(message, "Error")
    }
    
    class func shared() -> AppLibrary {
        return sharedManager
    }
    
}
