//
//  VWButton.swift
//  Vanga Weather
//
//  Created by Nick Beznos on 2/12/20.
//  Copyright © 2020 Nick Beznos. All rights reserved.
//

import UIKit

    class VWButton: UIButton {

        
        override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }
        
        
        convenience init(backGroundColor: UIColor, title: String) {
            self.init(frame: .zero)
            self.backgroundColor = backGroundColor
            self.setTitle(title, for: .normal)
        }
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        private func configure(){
            layer.cornerRadius                        = 10
            setTitleColor(.white, for: .normal)
            titleLabel?.font                          = UIFont.preferredFont(forTextStyle: .headline)
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        func set(backgroundColor: UIColor, title: String) {
            self.backgroundColor = backgroundColor
            setTitle(title, for: .normal)
        }
    }
