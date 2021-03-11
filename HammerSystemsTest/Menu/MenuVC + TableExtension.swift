//
//  MenuVC + TableExtension.swift
//  HammerSystemsTest
//
//  Created by Angelina on 07.02.2021.
//

import UIKit

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Configure Table View
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = headerView
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
        tableView.allowsSelection = false
        tableView.allowsMultipleSelection = false
        tableView.backgroundColor = .white
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view)
        }
    }
    
    //MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
        guard let images = products?[indexPath.row].images else { return cell }
        guard let names = products?[indexPath.row].name  else { return cell }
        guard let orders = products?[indexPath.row].ordersCount  else { return cell }
        
        cell.title.text = names
        cell.detail.text = "Количество заказов:"
        cell.button.setTitle("\(orders)", for: .normal)
        
        var imagesLinks = [""]
        
        images.map { link in
            for url in link.urls {
                imagesLinks.append(url)
            }
        }
        
        if imagesLinks[indexPath.row] == "" {
            cell.noPhoto.isHidden = false
        } else {
            cell.pizzaImage.loadImageFromUrl(withUrl: imagesLinks[indexPath.row])
        }
        
        return cell
    }
    
    //MARK: - Table View Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifier)
        return customHeader
    }
}
