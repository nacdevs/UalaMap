//
//  CitiesViewModel.swift
//  UalaMap
//
//  Created by Nestor Camela on 16/06/2025.
//

import Foundation
import Combine

public class CitiesViewModel: ObservableObject{
    @Published var cities:[City] = []
    @Published var searchResults: [City] = []
    
    var favs = [Int]()
    
    //Load Cities from JSON file
    func getCities(){
        if let url = Bundle.main.url(forResource: "cities.json", withExtension: nil){
            if let data = try? Data(contentsOf: url){
                let jsondecoder = JSONDecoder()
                do{
                    let result = try jsondecoder.decode([City].self, from: data)
                    let resultSorted = result.sorted { $0.name ?? "" < $1.name ?? ""}
                    if(favs.count == 0){
                        favs = UserDefaults.standard.array(forKey: "favs")  as? [Int] ?? [Int]()
                    }
                    let sortedFavs = checkFavs(cities: resultSorted, favs: favs)
                    self.cities = sortedFavs.sorted { $0.fav ?? false && !($1.fav ?? false) }
                    self.searchResults = self.cities
                }
                catch {
                    print("error trying parse json")
                }
            }
        }
    }
    
    
    //Checks if cities match with the fav list
    func checkFavs(cities: [City], favs: [Int]) -> [City]{
        var citiesTemp = cities
        var nFavs = 0
        for fav in favs {
            if let index = cities.firstIndex(where: {$0.id == fav}){
                lazy var temp = cities[index]
                temp.fav = true
                citiesTemp.remove(at: index)
                citiesTemp.insert(temp, at: 0)
                nFavs = nFavs + 1
            }
        }
        return citiesTemp
    }
    
    //Add fav if it doesn't exist, if it does deletes it
    //Used UserDefaults because CoreData seemed like an overkill
    func updateFavs(city:City){
        if(!favs.contains(city.id)){
            favs.append(city.id)
        }else{
            favs.removeAll{ $0 == city.id}
        }
        UserDefaults.standard.set(favs, forKey: "favs")
        self.getCities()
    }
    
    
    func searchList(_ searchText: String,_ closure: (() -> Void)? = nil)  {
        if(searchText.isEmpty){
            searchResults = cities
        }else{
            Task {
                let temp = self.cities.filter{$0.name?.lowercased().contains(searchText.lowercased()) ?? false}
                DispatchQueue.main.async {
                    self.searchResults = temp
                    closure?()
                }
            }
        }
    }
    
}
