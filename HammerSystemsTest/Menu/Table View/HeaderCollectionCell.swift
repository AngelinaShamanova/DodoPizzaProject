//
//  HeaderCollectionCell.swift
//  HammerSystemsTest
//
//  Created by Angelina on 04.02.2021.
//

import UIKit

class HeaderCollectionCell: UICollectionViewCell {
    
    //MARK: - Public properties
    static let reuseIdentifier = "headerCell"
    var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.setTitleColor(.systemOrange, for: .application)
        return button
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
        isUserInteractionEnabled = true
        addSubview(button)
        button.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.center.equalTo(self)
        }
    }
}
