//
//  ViewController.swift
//  MobileMapper2020
//
//  Created by Christopher Walter on 11/21/20.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate
{
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var currentLocation = CLLocation()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        currentLocation = locations[0]
    }


}

