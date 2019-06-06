//
//  PassengerView.swift
//  Uber Clone
//
//  Created by student on 2019/6/6.
//  Copyright © 2019年 Teacher. All rights reserved.
//

import UIKit
import FirebaseAuth
import MapKit
import CoreLocation

class PassengerView: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let userLocation = CLLocationCoordinate2D()
    
    var lyftBeenCalled = false
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func logout(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.dismiss(animated: true, completion: nil)
        } catch  {
            print("wow you can't sign out!")
        }
        
    } // .logout
    
    
    @IBAction func giveMeRide(_ sender: Any) {
        if lyftBeenCalled {
//            calcelLyft()
        } else {
//            callLyft()
        }
    } // .giveMeRide
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate: CLLocationCoordinate2D = manager.location?.coordinate {
            
            userLocation = coordinate
            
            let region = MKCoordinateRegion(center: userLocation, latitudinalMeters: 0.003, longitudinalMeters: 0.003)
            mapView.setRegion(region, animated: true)
            
            // TODO: unwrapped
            // mapView.removeAnnotation(mapView.annotations)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = userLocation
            annotation.title = "你在這！"
            mapView.addAnnotation(annotation)
        }
    } // .locationManager
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
