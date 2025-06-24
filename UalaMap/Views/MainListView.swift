//
//  MainListView.swift
//  UalaMap
//
//  Created by Nestor Camela on 16/06/2025.
//


import SwiftUI
import CoreLocation

struct MainListView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @StateObject private var viewModel = CitiesViewModel()
    @State private var searchText = ""
    @Binding var landscape: City?
    @State private var navigateToDetailView: Bool = false
    
    
    var body: some View {
        ZStack{
            NavigationStack{
                List(viewModel.searchResults, id: \.id){ city in
                    MainCellView(city: city)
                    .listRowSeparator(.hidden)
                    .swipeActions(edge: .trailing) {
                        if(city.fav ?? false){
                            handleAction(city: city, type: .destructive)
                        }
                    }
                    .swipeActions(edge: .leading){
                        handleAction(city: city)
                    }
                    .onTapGesture {
                            landscape = city
                        if(horizontalSizeClass == .compact){
                            navigateToDetailView = true
                        }
                          
                    }
                }
                .navigationTitle("Cities")
                .listStyle(.plain)
                .searchable(text: $searchText, prompt: "Search for a city")
                .onChange(of: searchText) { oldValue, newValue in
                    viewModel.searchList(searchText)
                }
                .background(
                  NavigationLink(
                    destination: CityDetailView(city:$landscape),
                    isActive: $navigateToDetailView
                  )
                  {
                    EmptyView()
                  }
                )
            }
            .onAppear{
                viewModel.getCities()
                
            }
            .refreshable {
                viewModel.getCities()
            }
            
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
        }
       
    }

    
    
    //Handle row swipe action
    private func handleAction(city: City, type: ButtonRole? = nil) -> some View {
        Button(role: type) {
            viewModel.updateFavs(city: city)
        } label: {
            VStack {
                if(type == .destructive){
                    Image(systemName: "wrongwaysign.fill")
                    Text("Delete Fav")
                }else{
                    Image(systemName: "star.fill")
                    Text("Add Fav")
                }
                
            }
        }
        .tint(type == .destructive ? .red : .blue)
    }
    
}

#Preview {
    @Previewable @State var city: City?
    MainListView(landscape: $city)
}



