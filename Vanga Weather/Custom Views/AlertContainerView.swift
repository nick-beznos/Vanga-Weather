//
//  AlertContainerView.swift
//  Vanga Weather
//
//  Created by Nick Beznos on 2/12/20.
//  Copyright © 2020 Nick Beznos. All rights reserved.
//

import UIKit

    class AlertContainerView: UIView {

        
        override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }

        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        private func configure() {
           backgroundColor                           = .systemBackground
           layer.cornerRadius                        = 16
           layer.borderWidth                         = 2
           layer.borderColor                         = UIColor.white.cgColor
           translatesAutoresizingMaskIntoConstraints = false
        }
    }

