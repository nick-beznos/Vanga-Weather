//
//  CityTableViewCell.swift
//  Vanga Weather
//
//  Created by Nick Beznos on 2/12/20.
//  Copyright © 2020 Nick Beznos. All rights reserved.
//

import UIKit


class CityTableViewCell: UITableViewCell {

    static let reuseID  = "CityCell"
    let cityLable       = UILabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(city: City) {
        cityLable.text = city.name
    }
    
    
    func configure() {
        addSubview(cityLable)
        cityLable.textAlignment             = .left
        cityLable.font                      = UIFont.systemFont(ofSize: 26)
        cityLable.textColor                 = .label
        cityLable.adjustsFontSizeToFitWidth = true
        cityLable.minimumScaleFactor        = 0.9
        cityLable.lineBreakMode             = .byTruncatingTail
        
        let padding: CGFloat = 20
        
        cityLable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityLable.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cityLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            cityLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            cityLable.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
