//
//  ViewController.swift
//  FindingUserLocation
//
//  Created by Luis Ramirez on 9/25/17.
//  Copyright © 2017 Lucho. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var mapKit: MKMapView!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation : CLLocation = locations[0]
        
//        let latitude = userLocation.coordinate.latitude
//        let longitude = userLocation.coordinate.longitude
//        let latDelta : CLLocationDegrees = 0.5
//        let lonDelta : CLLocationDegrees = 0.5
//
//        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
//
//        let location : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//
//        let region : MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
//
//        self.mapKit.setRegion(region, animated: true)
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil {
                print(error ?? "")
            } else {
                guard let placemark = placemarks?[0] else { return }
                
                guard let subThoroughFare = placemark.subThoroughfare, let thoroughFare = placemark.thoroughfare, let subLocality = placemark.subLocality, let subadministrativeArea = placemark.subAdministrativeArea, let postalCode = placemark.postalCode else
                {
                    return
                }
                
                print(placemark)
                print("Subthorough Fare: \(subThoroughFare), ThoroughFare: \(thoroughFare), Sublocality: \(subLocality), Subadministrative Area: \(subadministrativeArea), Postal code: \(postalCode)")
            }
        }
    }


}

