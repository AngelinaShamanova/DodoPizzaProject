//
//  MenuViewController.swift
//  HammerSystemsTest
//
//  Created by Angelina on 04.02.2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - Private properties
    private let viewModel = TopProductsViewModel()
    private let activityIndicator = UIActivityIndicatorView()
    
    // MARK: - Public properties
    var collectionView: UICollectionView!
    var tableView = UITableView()
    var headerView = HeaderView()
    var products: [Products]?
    var banners = ["dodo1.png", "dodo2.png", "dodo3.png", "dodo4.png", "dodo5.png"]
    
    // MARK: - Lifecycle VC
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getDataFromNet()
        configureUI()
        configureCollectionView()
        configureTableView()
        tableView.isHidden = true
        activityIndicator.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 20)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK: - Private funcs
    private func getDataFromNet() {
        self.viewModel.getTopProductsInRussia { [weak self] data in
            if !data.countries.isEmpty {
                let _ = data.countries.map { [weak self] country in
                    if country.countryId == 643 {
                        self?.products = country.products
                        self?.activityIndicator.stopAnimating()
                        self?.tableView.reloadData()
                        self?.tableView.isHidden = false
                    }
                }
            }
        }
    }
    
    private func configureUI() {
        activityIndicator.color = .black
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        view.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }
}
