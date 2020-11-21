//
//  ViewController.swift
//  MobileMapper2020
//
//  Created by Christopher Walter on 11/21/20.
//

import UIKit
import MapKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
        
        
        
    }


}

