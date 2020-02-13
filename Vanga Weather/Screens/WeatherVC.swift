//
//  WeatherVC.swift
//  Vanga Weather
//
//  Created by Nick Beznos on 2/12/20.
//  Copyright © 2020 Nick Beznos. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {
    
    let cityLabel = UILabel()
    let weatherDescription = UILabel()
    let wetherLabel = UILabel()
    let wetherIcon = UIImageView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()

        configureCityLabel()
        configureDescriptionLabel()
        configureWeatherLabel()
        configureIcon()
    }
    
    
    func configureVC() {
        view.backgroundColor = .systemBackground
        //let backButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        //navigationItem.rightBarButtonItem = doneButton
    }

    
    
    func configureCityLabel() {
        
    }
    
    
    func configureDescriptionLabel() {
        
    }
    
    
    func configureWeatherLabel() {
        
    }
    
    
    func configureIcon() {
        
    }

}
