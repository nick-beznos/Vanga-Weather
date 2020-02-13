//
//  WeatherVC.swift
//  Vanga Weather
//
//  Created by Nick Beznos on 2/12/20.
//  Copyright © 2020 Nick Beznos. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {
    
    let cityLabel          = UILabel()
    let weatherDescription = UILabel()
    let tempLabel          = UILabel()
    let weatherIcon        = UIImageView()
    
    var cityID: Int!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        getWeaterInfo()
        configureUIAndLayout()
    }
    
    
    init(with cityID: Int) {
        super.init(nibName: nil, bundle: nil)
        self.cityID = cityID
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureVC() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.leftBarButtonItem = doneButton
    }
    
    
    func configureUIElements(with weather: Weather) {
        var temp = weather.main.temp - 273.15
        temp = temp.rounded(toPlaces: 1)
        
        cityLabel.text          = weather.name
        weatherDescription.text = weather.weather.first?.description
        tempLabel.text          = String(temp) + "℃"
        weatherIcon.image       = UIImage(named: weather.weather.last?.icon ?? "defaultIcon")
    }

    
    func getWeaterInfo() {
        NetworkManager.shared.getWeather(for: cityID) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let weather):
                DispatchQueue.main.async { self.configureUIElements(with: weather) }
            case.failure(let error):
                self.presentGFAllertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "ok")
            }
        }
    }
    
    
    func configureUIAndLayout() {
        let weatherViews = [cityLabel, tempLabel, weatherDescription, weatherIcon]
        
        for view in weatherViews {
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        cityLabel.font                  = UIFont.preferredFont(forTextStyle: .largeTitle)
        cityLabel.textAlignment         = .center
        cityLabel.textColor             = .label
        cityLabel.minimumScaleFactor    = 0.75
        cityLabel.lineBreakMode         = .byTruncatingTail
        
        tempLabel.font                  = .boldSystemFont(ofSize: 100)
        tempLabel.textAlignment         = .center
        tempLabel.textColor             = .label
        
        weatherDescription.font                  = UIFont.preferredFont(forTextStyle: .title1)
        weatherDescription.textAlignment         = .center
        weatherDescription.textColor             = .label
        weatherDescription.minimumScaleFactor    = 0.75
        weatherDescription.lineBreakMode         = .byWordWrapping
                
        NSLayoutConstraint.activate([
            weatherIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            weatherIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            weatherIcon.heightAnchor.constraint(equalToConstant: 100),
            weatherIcon.widthAnchor.constraint(equalToConstant: 100),
            
            cityLabel.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor),
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.heightAnchor.constraint(equalToConstant: 50),
            
            weatherDescription.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10),
            weatherDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherDescription.heightAnchor.constraint(equalToConstant: 30),

            tempLabel.topAnchor.constraint(equalTo: weatherDescription.bottomAnchor, constant: 70),
            tempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tempLabel.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
    

    @objc func dismissVC() {
           dismiss(animated: true)
       }
}
