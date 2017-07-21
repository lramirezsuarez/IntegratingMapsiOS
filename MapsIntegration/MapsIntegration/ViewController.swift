//
//  ViewController.swift
//  MapsIntegration
//
//  Created by Luis Ramirez on 7/20/17.
//  Copyright © 2017 Lucho. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latitude : CLLocationDegrees = 6.268
        let longitude : CLLocationDegrees = -75.666
        let latDelta : CLLocationDegrees = 2
        let lonDelta : CLLocationDegrees = 2
        
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let location : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region : MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
        
        
    }

}

