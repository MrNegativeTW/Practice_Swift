//
//  DriverView.swift
//  Uber Clone
//
//  Created by student on 2019/6/6.
//  Copyright © 2019年 Teacher. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase
import CoreLocation
import MapKit

class DriverView: UITableViewController, CLLocationManagerDelegate {

    var LocationManager = CLLocationManager()
    
    let reference = Database.database().reference()
    
    var passRequests: [DataSnapshot] = []
    
    let driverLocation = CLLocationCoordinate2D()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        retriveData()
        
        LocationManager.delegate = self
        LocationManager.desiredAccuracy = kCLLocationAccuracyBest
        LocationManager.requestWhenInUseAuthorization()
        LocationManager.startUpdatingLocation()
        
        tableView.reloadData()
    }
    
    
    func  retriveData() {
        reference.child("passRequest").observe(.childAdded) { (DataSnapshot) in
            self.passRequests.append(DataSnapshot)
            DataSnapshot.ref.removeAllObservers()
        } // .reference child
        
        self.tableView.reloadData()
    }
    
    
    @IBAction func logoutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            navigationController?.dismiss(animated: true, completion: nil)
        } catch  {
            print("wow you can't sign out!")
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let snapShot = passRequests[indexPath.row]
        if let passRequestDic = snapShot.value as? [String: Any]{
            if let email = passRequestDic["email"] as? String {
                if let latitude = passRequestDic["lat"] as? Double {
                    if let longtitude = passRequestDic["lon"] as? Double {
                        let passCLLocation  = CLLocation(latitude: latitude, longitude: longtitude)
                        
                        let driverCLLocation = CLLocation(latitude: driverLocation.latitude, longitude: driverLocation.longitude)
                        
                        let distance = passCLLocation.distance(from: driverCLLocation) / 1000
                        
                        let roundDist = round(distance * 100) / 100
                        
                        if let image = UIImage(named: "defaultProfileImage") {
                            let passInfo = "\(roundDist) KM Away"
                            cell.configureCell
                        } // .image
                        
                    }
                }
                
            }
        }
        
//         Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
