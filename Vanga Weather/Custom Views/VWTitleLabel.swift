//
//  VWTitleLabel.swift
//  Vanga Weather
//
//  Created by Nick Beznos on 2/12/20.
//  Copyright © 2020 Nick Beznos. All rights reserved.
//

import UIKit

    class VWTitleLabel: UILabel {

        
        override init(frame: CGRect) {
            super.init(frame: frame)
             configure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
            self.init(frame: .zero)
            self.textAlignment = textAlignment
            self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        }
        
        
        private func configure() {
            textColor                                   = .label
            adjustsFontSizeToFitWidth                   = true
            minimumScaleFactor                          = 0.9
            lineBreakMode                               = .byTruncatingTail
            translatesAutoresizingMaskIntoConstraints   = false
        }

    }
