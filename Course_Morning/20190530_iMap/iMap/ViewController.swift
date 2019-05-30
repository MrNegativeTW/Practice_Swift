//
//  ViewController.swift
//  iMap
//
//  Created by student on 2019/5/30.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var mapkitView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mapkitView.delegate = self
        mapkitView.showsUserLocation = true
        
        locationManager.delegate = self
        
        // Accuracy of location
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // Request user auth
        // Always: requestAlwaysAuthorization
        // When in use: requestWhenInUseAuthorization
        // Remember Add row in Info.plist
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        centerUserLocation()
        
        addGesture()
    }


    @IBAction func currentLocation(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
            self.centerUserLocation()
        }
        
    } // .currentLocation
    
    // Real User's Location
    func centerUserLocation() {
        
        if let coordinate = locationManager.location?.coordinate {
            
            let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
            
            let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: span)
            
            mapkitView.setRegion(region, animated: true)
        }
        
    } // .centerUserLocation
    
    
    func addGesture() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(wowPin(sender: )))
        
        longPress.delegate = self
        longPress.minimumPressDuration = 0.5
        mapkitView.addGestureRecognizer(longPress)
    }
    
    
    @objc func wowPin(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.began {
            let annotation = MKPointAnnotation()
            // annotation.title = "undefine location"
            // annotation.subtitle = "undefine description"
            
            let touchPoint = sender.location(in: mapkitView)
            let locationCoordinate = mapkitView.convert(touchPoint, toCoordinateFrom: mapkitView)
            
            annotation.coordinate = locationCoordinate
            
            let userLocation: CLLocation = CLLocation(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)
            CLGeocoder().reverseGeocodeLocation(userLocation) { (Placemark, error) in
                if error != nil {
                    print("Success Erorr!")
                } else {
                    if let Placemarks = Placemark?[0] {
                        annotation.title = Placemarks.name
                        annotation.subtitle = Placemarks.locality
                    }
                    
                }
                
            } // .reverseGeocodeLocation
            
            mapkitView.addAnnotation(annotation)
            
        } // .Gesture Recongnizer
        
    } // .wowPin()
    
    
}

