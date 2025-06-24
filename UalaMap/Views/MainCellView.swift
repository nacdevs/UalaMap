//
//  MainCellView.swift
//  UalaMap
//
//  Created by Nestor Camela on 16/06/2025.
//

import Foundation
import SwiftUI

struct MainCellView: View{
    let city: City
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5){
                Text("\(city.name ?? "-") - \(city.country ?? "-")")
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("lat:\(city.coord?.lat ?? 0.0)\nlong:\(city.coord?.lon ?? 0.0)")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 5){
                if(city.fav ?? false){
                    Image(systemName: "star.fill")
                }
            }
            .padding(.leading)
           
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainCellView(city: MockData.sampleCity)
}
