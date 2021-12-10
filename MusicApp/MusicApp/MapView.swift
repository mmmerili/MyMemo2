//
//  MapView.swift
//  MusicApp
//
//  Created by iosdev on 8.12.2021.
//

import Foundation
import MapKit
import SwiftUI

struct MapView: View{
    
    @StateObject private var viewModel = MapViewModel()
    var body: some View{
        
        
        
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color(hexStringToUIColor(hex: "#24368a")))
            .onAppear{
                viewModel.checkIfLocationServicesIsEnabled()
            }
    }
}

struct MapView_Previews: PreviewProvider{
    static var previews: some View{
        MapView()
    }
}


