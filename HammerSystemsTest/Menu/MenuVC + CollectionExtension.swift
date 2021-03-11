//
//  MenuVC + CollectionExtension.swift
//  HammerSystemsTest
//
//  Created by Angelina on 07.02.2021.
//

import UIKit

extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: - Configure Collection View
    func configureCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.size.width - 40, height: 130)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MenuCollectionCell.self, forCellWithReuseIdentifier: MenuCollectionCell.cellId)
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(140)
        }
    }
    
    //MARK: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionCell.cellId, for: indexPath) as! MenuCollectionCell
        cell.imageView.image = UIImage(named: "\(banners[indexPath.item])")
        return cell
    }
}
