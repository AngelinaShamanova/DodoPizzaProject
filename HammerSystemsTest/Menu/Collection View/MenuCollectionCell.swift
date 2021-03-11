//
//  MenuCollectionCell.swift
//  HammerSystemsTest
//
//  Created by Angelina on 04.02.2021.
//

import UIKit

class MenuCollectionCell: UICollectionViewCell {
    
    //MARK: - Public properties
    static let cellId = "collectionCell"
    var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 12
        return image
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private funcs
    private func configureUI() {
        addSubview(imageView)
        layoutConstraints()
    }
    
    private func layoutConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
