//
//  MapViewModel.swift
//  HappApp
//
//  Created by Turner White on 9/28/22.
//

import Foundation
import MapKit

enum MapDetails {
    static let defaultCenter = CLLocationCoordinate2D(latitude: 35.9132, longitude: -79.0558)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var didCheckOnce = false
    var locationManager: CLLocationManager?
    @Published var region = MKCoordinateRegion(center:MapDetails.defaultCenter, span:MapDetails.defaultSpan)
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            didCheckOnce = true
        } else {
            print("Location not enabled")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Location is restricted, likely due to parental controls")
        case .denied:
            print("Location permission denied, go to settings and enable location usage.")
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
