//
//  VWBodyLabel.swift
//  Vanga Weather
//
//  Created by Nick Beznos on 2/12/20.
//  Copyright © 2020 Nick Beznos. All rights reserved.
//

import UIKit


    class VWBodyLabel: UILabel {

    
        override init(frame: CGRect) {
            super.init(frame: frame)
             configure()
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        convenience init(textAlignment: NSTextAlignment) {
            self.init(frame: .zero)
            self.textAlignment = textAlignment
        }
        
        
        private func configure() {
            textColor                                   = .secondaryLabel
            font                                        = UIFont.preferredFont(forTextStyle: .body)
            adjustsFontSizeToFitWidth                   = true
            minimumScaleFactor                          = 0.75
            lineBreakMode                               = .byWordWrapping
            translatesAutoresizingMaskIntoConstraints   = false
        }
    }

