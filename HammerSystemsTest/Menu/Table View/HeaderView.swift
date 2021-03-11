//
//  HeaderView.swift
//  HammerSystemsTest
//
//  Created by Angelina on 04.02.2021.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: - Public properties
    static let identifier = "headerView"
    var collectionView: UICollectionView!
    var action = ["Пицца", "Комбо", "Закуски", "Десерты", "Напитки"]
    
    //MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 30)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HeaderCollectionCell.self, forCellWithReuseIdentifier: HeaderCollectionCell.reuseIdentifier)
        collectionView.allowsSelection = false
        collectionView.allowsMultipleSelection = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        backgroundColor = .white
        isUserInteractionEnabled = true
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        action.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCollectionCell.reuseIdentifier, for: indexPath) as! HeaderCollectionCell
        cell.button.setTitle("\(action[indexPath.item])", for: .normal)
            return cell
    }
}
