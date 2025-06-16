//
//  MainListView.swift
//  UalaMap
//
//  Created by Nestor Camela on 16/06/2025.
//


import SwiftUI

struct MainListView: View {
    
    @StateObject private var viewModel = CitiesViewModel()
    @State private var searchText = ""
    @State var showingAlert: Bool = false

    
    var body: some View {
        ZStack{
            NavigationView{
                List(searchResults, id: \.id){ city in
                        MainCellView(city: city).background(
                      //      NavigationLink("",destination: ItemDetailView(item: item))
                        //        .opacity(0)
                        )
                        .listRowSeparator(.hidden)
                        .onLongPressGesture {
                            viewModel.updateFavs(city: city)
                            showingAlert = true
                        }
                    
                }
                .navigationTitle("Cities")
                .listStyle(.plain)
                .searchable(text: $searchText, prompt: "Search for a city")
               
            }
            .onAppear{
                viewModel.getCities()
                
            }
            .refreshable {
                viewModel.getCities()
            }
            
        }.alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Favoritos actualizados"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    //Search logic
    var searchResults: [City] {
         if searchText.isEmpty {
             return viewModel.cities
         } else {
             return viewModel.cities.filter{$0.name?.lowercased().contains(searchText.lowercased()) ?? false}
         }
     }
    
}

#Preview {
    MainListView()
}

extension UserDefaults {
    var isFavorite: [Int] {
        get {
            array(forKey: "isFavorit") as? [Int] ?? []
        }
        set {
            set(newValue, forKey: "isFavorit")
        }
    }
}

