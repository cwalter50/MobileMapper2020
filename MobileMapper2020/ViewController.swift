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
    
    var parks = [MKMapItem]()
    
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

    @IBAction func zoomButtonTspped(_ sender: UIBarButtonItem)
    {
        let center = currentLocation.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        let region = MKCoordinateRegion(center: center, span: span)
        
        mapView.setRegion(region, animated: true)
        
    }
    
    @IBAction func SearchButtonTapped(_ sender: UIBarButtonItem)
    {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "Parks"
        
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        
        search.start {
            response, error in
            
            guard let theResponse = response else {return}
            
            for mapItem in theResponse.mapItems
            {
                self.parks.append(mapItem)
                let annotation = MKPointAnnotation()
                annotation.coordinate = mapItem.placemark.coordinate
                annotation.title = mapItem.name
                self.mapView.addAnnotation(annotation)
                
            }
            
        }
        
        
    }
    
    
}

