//
//  CityDetailView.swift
//  UalaMap
//
//  Created by Nestor Camela on 16/06/2025.
//

import SwiftUI
import MapKit

struct CityDetailView: View {
    @Binding var city: City?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            MapView(city: $city)
            
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text(city?.name ?? "")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(city?.country ?? "")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
                
                Spacer()
                    Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.8))
                    .font(.title2)
            }
            
            .padding(.horizontal)
            .padding(.vertical, 25)
            .frame(maxWidth: .infinity)
            .background(Color.black.opacity(0.7))
            .cornerRadius(16, corners: [.topLeft, .topRight])
        }
        .navigationBarTitle("Ubicacion")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
