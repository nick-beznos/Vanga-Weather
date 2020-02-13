//
//  SearchScreen.swift
//  Vanga Weather
//
//  Created by Nick Beznos on 2/11/20.
//  Copyright © 2020 Nick Beznos. All rights reserved.
//

import UIKit

class SearchScreen: UIViewController {
    let searchController = UISearchController(searchResultsController: nil)
    var tableView = UITableView()
    
    enum Section: Hashable { case main }
    
    var searchCities = [City]()
    var isSearching = false
    var weather: Weather!
    var dataSource: UITableViewDiffableDataSource<Section, City>!


    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchScreen()
        configureSearchController()
        configureTableView()
        configureDataSource()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    func configureSearchScreen() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        title = "Weather"
    }
    
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for city"
        navigationItem.searchController = searchController
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate        = self
        tableView.dataSource      = self
        tableView.backgroundColor = .systemBackground
        tableView.rowHeight       = 50
        
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: CityTableViewCell.reuseID)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    func getWeather(for city: City) {
        showLoadingView()
        NetworkManager.shared.getWeather(for: city.id) { [weak self] result in
            guard let self = self else { return }
            self.dissmissLoadingView()
            
            switch result {
            case .success(let weather):
                self.weather = weather
                
            case .failure(let error):
                self.presentGFAllertOnMainThread(title: "bad stuff happened", message: error.rawValue, buttonTitle: "Ok")
            }

        }
    }
    
    
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, City>(tableView: tableView, cellProvider: { (tableView, indexPath, city) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.reuseID, for: indexPath) as! CityTableViewCell
            cell.set(city: city)
            return cell
        })
    }
    
    
    func updateData(on cities: [City]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, City>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cities, toSection: .main)
        
        DispatchQueue.main.async {
            //guard self.dataSource != nil else { return }
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    

}

extension SearchScreen: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching = true
        searchCities = listOfCities.filter { $0.name.lowercased().contains(filter.lowercased()) }
        
        // max ammount of filtered cities is 10
        if searchCities.count > 10 {
            searchCities = searchCities.dropLast(searchCities.count - 10)
        }
        print("searchCities.count = ", searchCities.count)
        updateData(on: searchCities)
        
    }

     
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchCities.removeAll()
        updateData(on: searchCities)
        isSearching = false
    }
}


extension SearchScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchCities.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.reuseID) as! CityTableViewCell
        let city = searchCities[indexPath.row]
        cell.set(city: city)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = searchCities[indexPath.row]
        let destVC = WeatherVC(with: city.id)
        present(destVC, animated: true)
    }
    
    
}
