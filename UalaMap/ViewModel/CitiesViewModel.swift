//
//  CitiesViewModel.swift
//  UalaMap
//
//  Created by Nestor Camela on 16/06/2025.
//

import Foundation

final class CitiesViewModel: ObservableObject{
    @Published var cities:[City] = []
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
                    self.cities = checkFavs(cities: resultSorted, favs: favs)
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
                citiesTemp.remove(at: index)
                citiesTemp.insert(temp, at: 0)
                nFavs = nFavs + 1
                print("Found fav")
            }
        }
        print("favs--> \(nFavs)")
        return citiesTemp
    }
    
    //Add fav if it doesn't exist if does deletes it
    func updateFavs(city:City){
        if(!favs.contains(city.id)){
            favs.append(city.id)
        }else{
            favs.removeAll{ $0 == city.id}
        }
        UserDefaults.standard.set(favs, forKey: "favs")
        print("Updated favs")
    }
}
