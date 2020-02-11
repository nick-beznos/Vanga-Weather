//
//  AppDelegate.swift
//  Vanga Weather
//
//  Created by Nick Beznos on 2/11/20.
//  Copyright © 2020 Nick Beznos. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        getCitiesFromJSON()
        NetworkManager.shared.getWeather(for: 2643743) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let weather):
                print(weather)
            case .failure(let error):
                print(error.rawValue)
            }

        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate {
    func getCitiesFromJSON() {
        guard !listOfCities.isEmpty else { return }
        
        // Get url for file
        guard let fileUrl = Bundle.main.url(forResource: "listOfCities", withExtension: "json") else {
            print("File could not be located at the given url")
            return
        }
        
        do {
            
            let decoder     = JSONDecoder()
            let data        = try Data(contentsOf: fileUrl)
            listOfCities    = try decoder.decode([City].self, from: data)

            
        } catch {
            // Print error if something went wrong
            print("Error: \(error)")
        }
    }
}

