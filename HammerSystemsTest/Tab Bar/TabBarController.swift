//
//  TabBarController.swift
//  HammerSystemsTest
//
//  Created by Angelina on 04.02.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - Private properties
    private let mainViewController = MenuViewController()
    private let profileViewController = ProfileViewController()
    private let contactsViewController = ContactsViewController()
    private let trashViewController = TrashViewController()

    //MARK: - Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewControllers = [
            generateViewController(rootViewController: mainViewController, image: #imageLiteral(resourceName: "pizza"), title: "Меню"),
            generateViewController(rootViewController: profileViewController, image: #imageLiteral(resourceName: "profile"), title: "Профиль"),
            generateViewController(rootViewController: contactsViewController, image: #imageLiteral(resourceName: "contacts"), title: "Контакты"),
            generateViewController(rootViewController: trashViewController, image: #imageLiteral(resourceName: "trash"), title: "Корзина")
        ]
    }

    //MARK: - Private funcs
    private func generateViewController(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.badgeColor = .white
        rootViewController.navigationItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        return navigationVC
    }
}

