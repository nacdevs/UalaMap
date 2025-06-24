//
//  CitiesVMMock.swift
//  UalaMap
//
//  Created by Nestor Camela on 23/06/2025.
//

//  MARK: Explanation

/**This Mock fuction is to be a middleman if it is necessary to add something
    or have a fix result if the parent function changes
    this override will break the test and be a red flag in the CI or when running local
 **/

final class CitiesVMMock: CitiesViewModel{
    override func getCities() {
        super.getCities()
    }
    
    override func searchList(_ searchText: String, _ closure: (() -> Void)? = nil) {
        super.searchList(searchText,closure)
    }
}
