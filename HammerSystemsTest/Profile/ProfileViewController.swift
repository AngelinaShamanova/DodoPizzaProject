//
//  ProfileViewController.swift
//  HammerSystemsTest
//
//  Created by Angelina on 04.02.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK: - Lifecycle VC
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 20)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
}
