//
//  ViewController.swift
//  MapDemo
//
//  Created by Trevor Wu on 2019/5/30.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//
// Basic Usage of Mapkit, CoreLocation
// Device: iPhone 8 Plus

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIGestureRecognizerDelegate {

    // Connect with Storyboard
    @IBOutlet weak var mapkitView: MKMapView!
    
    // init Location Manager
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapkitView.delegate = self
        locationManager.delegate = self
        
        // Accuracy of location
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // Request user auth
        // Always: requestAlwaysAuthorization
        // When in use: requestWhenInUseAuthorization
        // Remember Add row in Info.plist
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        initMapKitView()
        
        // Use Long Press to add pin on map
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(wowPin(sender: )))
        longPress.delegate = self
        longPress.minimumPressDuration = 1
        mapkitView.addGestureRecognizer(longPress)
        
    }

    
    @objc func wowPin(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
           let annotation = MKPointAnnotation()
            annotation.title = "undefine location"
            annotation.subtitle = "undefine description"
            
            let touchPoint = sender.location(in: mapkitView)
            let locationCoordinate = mapkitView.convert(touchPoint, toCoordinateFrom: mapkitView)
            
            annotation.coordinate = locationCoordinate
            mapkitView.addAnnotation(annotation)
        } // .Gesture Recongnizer
        
    } // .wowPin
    
    // Custom Location
    func initMapKitView() {
        // 49.212399, -122.959162
        
        let latitude: CLLocationDegrees = 49.212399
        let longtitude: CLLocationDegrees = -122.959162
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        
        let latdelta: CLLocationDegrees = 0.007
        let longdelta: CLLocationDegrees = 0.007
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latdelta, longitudeDelta: longdelta)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        mapkitView.setRegion(region, animated: true)
        mapkitView.showsUserLocation = true
    }
    
    // Real User's Location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // print(locations)
        let userLocation: CLLocation = locations[0]
        let latitude = userLocation.coordinate.latitude
        let longtitude = userLocation.coordinate.longitude
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        
        let latdelta: CLLocationDegrees = 0.003
        let longdelta: CLLocationDegrees = 0.003
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latdelta, longitudeDelta: longdelta)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        mapkitView.setRegion(region, animated: true)
        
        
    }
    
    
    
}
