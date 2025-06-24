//
//  ContentView.swift
//  UalaMap
//
//  Created by Nestor Camela on 16/06/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
       var body: some View {
           if horizontalSizeClass == .compact {
              PortraitView()
           } else {
             LandscapeView()
           }
       }
}

#Preview {
    ContentView()
}
