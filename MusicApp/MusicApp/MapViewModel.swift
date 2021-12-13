//
//  MapViewModel.swift
//  MusicApp
//
//  Created by iosdev on 8.12.2021.
//

import MapKit
import SwiftUI

enum mapDetails{
    static let startingLocation = CLLocationCoordinate2D(latitude: 60.192059, longitude: 24.945831)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
}

final class MapViewModel: NSObject ,ObservableObject, CLLocationManagerDelegate{
    @Published var region = MKCoordinateRegion(center: mapDetails.startingLocation,
                                               span: mapDetails.defaultSpan)
    var locationManager: CLLocationManager?
    
    //var annotation = MKPointAnnotation()
    //annotation = locationManager?.location!.coordinate
    
    func checkIfLocationServicesIsEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("location services off")
        }
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus{
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("your location is restricted")
        case .denied:
            print("your location is denied")
        case .authorizedAlways, .authorizedWhenInUse:
            if let loc = locationManager.location{
                region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: mapDetails.defaultSpan)
            }
            //region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        //span: mapDetails.defaultSpan)
        @unknown default:
            break
        }

    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
