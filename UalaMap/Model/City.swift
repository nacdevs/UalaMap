//
//  City.swift
//  UalaMap
//
//  Created by Nestor Camela on 16/06/2025.
//

import Foundation

struct City: Identifiable, Decodable{
    var _id: Int
    let country: String?
    let name: String?
    let coord: Geo?
    
    var id: Int {
          _id
      }
}

struct CityResponse: Decodable{
    let request: [City]
}

struct Geo: Decodable{
    let lon: Double?
    let lat: Double?
}


struct MockData {
    static let cities = [sampleCity, sampleCity, sampleCity]
    
    static let sampleCity = City(_id: 2,country: "AR", name: "Mock",coord: Geo(lon: 34.2833, lat: 44.549))
    
}
