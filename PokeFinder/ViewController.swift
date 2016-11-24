//
//  ViewController.swift
//  PokeFinder
//
//  Created by Fahad Rehman on 11/24/16.
//  Copyright © 2016 Codecture. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , MKMapViewDelegate , CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var LocationManager = CLLocationManager()
    
    var mapcentered = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.follow //follows with the user
        
    }
    override func viewDidAppear(_ animated: Bool) {
        authStatus()
    }
    
    
    
    
    func authStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            LocationManager.requestWhenInUseAuthorization()
        }
        
    }

    
   
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //when user allows the access to the location
        
        if status == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
    }
    
    
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        if let loc = userLocation.location {
            if !mapcentered {
                centerMapOnLocation(location: loc)
                mapcentered = true
            }
        }
    }
    

    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       
        var annotationView = MKAnnotationView()
        if annotation.isKind(of: MKUserLocation.self) {
         
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")
            annotationView.image = UIImage(named: "ash")
        }
        return annotationView
    }
    
    
    
    
    @IBAction func PokemonFinder(_ sender: Any) {
    }

    
    
    
}











































