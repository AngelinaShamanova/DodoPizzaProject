//
//  TableViewCell.swift
//  HammerSystemsTest
//
//  Created by Angelina on 04.02.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    //MARK: - Public properties
    static let reuseIdentifier = "secondCell"
    var pizzaImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    var title: UILabel = {
        let label = UILabel()
        label.text = "Пицца"
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    var detail: UILabel = {
        let label = UILabel()
        label.text = "Собери свою пиццу"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .darkGray
        return label
    }()
    var button: UIButton = {
        let button = UIButton()
        button.titleLabel?.textAlignment = .center
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        return button
    }()
    var noPhoto: UILabel = {
        let label = UILabel()
        label.text = "Изображение отсутвует"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 15)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        noPhoto.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private funcs
    private func configureUI() {
        backgroundColor = .white
        addSubview(pizzaImage)
        addSubview(title)
        addSubview(detail)
        addSubview(button)
        addSubview(noPhoto)
        
        pizzaImage.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.width.height.equalTo(120)
            make.leading.equalTo(self).offset(13)
        }
        noPhoto.snp.makeConstraints { make in
            make.edges.equalTo(pizzaImage)
        }
        title.snp.makeConstraints { make in
            make.top.equalTo(pizzaImage.snp.top).offset(10)
            make.leading.equalTo(pizzaImage.snp.trailing).offset(13)
            make.trailing.equalTo(self).offset(-13)
        }
        detail.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(5)
            make.leading.equalTo(title)
            make.trailing.equalTo(self).offset(-13)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(detail.snp.bottom).offset(10)
            make.leading.equalTo(detail)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
    }
}
