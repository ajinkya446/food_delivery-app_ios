//
//  LocationManager.swift
//  food-delivery-app
//
//  Created by Ajinkya Aher on 13/03/25.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    static let shared = LocationManager() // ✅ Define shared instance properly

    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?

    override private init() { // ✅ Private init to enforce singleton pattern
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("DEBUG: Not Determined")
        case .restricted:
            print("DEBUG: Restricted")
        case .denied:
            print("DEBUG: Denied")
        case .authorizedAlways, .authorizedWhenInUse:
            print("DEBUG: Authorized")
            manager.startUpdatingLocation()
        @unknown default:
            print("DEBUG: Unknown authorization status")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else { return }
        DispatchQueue.main.async {
            self.userLocation = lastLocation
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("DEBUG: Failed to get location - \(error.localizedDescription)")
    }
}
