//
//  MapView.swift
//  MusicApp
//
//  Created by iosdev on 8.12.2021.
//

import Foundation
import MapKit
import SwiftUI


//karttanäkymä

struct MapView: View{
    
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View{
        
        
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color(hexStringToUIColor(hex: "#1d4a8a")))
            .onAppear{
                viewModel.checkIfLocationServicesIsEnabled()
                
            }
        VStack{
            Text("You are here").fontWeight(.heavy).font(.custom("PT Serif", size: 30)).frame(width: 300, height: 70, alignment: .center).foregroundColor(.white).background(Color(hexStringToUIColor(hex: "#1d4a8a"))).cornerRadius(10)
            //Image(systemName: "heart.fill").foregroundColor(.white)
        }.ignoresSafeArea()
        
    }
    
    struct MapView_Previews: PreviewProvider{
        static var previews: some View{
            MapView()
        }
    }
    
}
