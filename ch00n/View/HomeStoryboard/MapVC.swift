//
//  MapVC.swift
//  ch00n
//
//  Created by MACBOOK on 20/04/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    let locationManager = CLLocationManager()
    var customPinCoordinates: CLLocationCoordinate2D?
    var currentLocation: CLLocationCoordinate2D?

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

      //  mapView.delegate = self
        checkLocationServices()
        locationManager.delegate = self

        // Do any additional setup after loading the view.
    }
    
    //MARK: - checkLocationServices
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
        }
    }
    
    //MARK: - checkLocationAuthourization
    func checkLocationAuthorization() {
        locationManager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
        else if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: locationManager)
        }
    }
    
    //MARK: - beginLocationUpdates
    private func beginLocationUpdates(locationManager: CLLocationManager) {
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }

    //MARK: - zoomToLatestLocation
    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D) {
        let zoomRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(zoomRegion, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - CLLocationManagerDelegate
extension MapVC: CLLocationManagerDelegate {
    
    // didUpdateLocations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Did get latest locations")
        guard let latestLocation = locations.first
            else {
                return
        }
        
        if currentLocation == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
            
        }
        currentLocation = latestLocation.coordinate
        manager.stopUpdatingLocation()
    }
    
    // didChangeAuthourization
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("the status changed")
        
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: manager)
        }
    }
}

//MARK: - MKMapViewDelegate
extension HomeVC: MKMapViewDelegate {
    
    // viewFor Annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       return MKAnnotationView()
        
    }
    
}
