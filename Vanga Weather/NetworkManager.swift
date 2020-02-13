//
//  NetworkManager.swift
//  Vanga Weather
//
//  Created by Nick Beznos on 2/11/20.
//  Copyright © 2020 Nick Beznos. All rights reserved.
// https://api.openweathermap.org/data/2.5/weather?id=2643743&appid=5e570dcdd771b46fbe6ae9a2496c8d34

import Foundation

class NetworkManager {
    static let shared           = NetworkManager()
    private let baseUrl         = "https://api.openweathermap.org/data/2.5/weather?id="
    private let apiID           = "5e570dcdd771b46fbe6ae9a2496c8d34"
    
    private init() {}

    func getWeather(for cityID: Int, completed: @escaping(Result<Weather, VWError>) -> Void) {
        let endPoint = baseUrl + String(cityID) + "&appid=" + apiID
        
           guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidURL))
               return
           }
           
           let task = URLSession.shared.dataTask(with: url) { data, responce, error in
               if let error = error {
                completed(.failure(.unableToComlete))
                print(error)
               }
               
               guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else {
                   completed(.failure(.invalidResponse))
                   return
               }
               
               guard let data = data else {
                   completed(.failure(.invalidData))
                
                   return
               }
                           
               do {
                let decoder                     = JSONDecoder()
                let weather                     = try decoder.decode(Weather.self, from: data)
                completed(.success(weather))
               } catch {
                   completed(.failure(.invalidData))
               }
           }
           task.resume()
    }
}
