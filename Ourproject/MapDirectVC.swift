//
//  MapDirectVC.swift
//  Ourproject
//
//  Created by 黃德桑 on 2019/5/10.
//  Copyright © 2019 sun. All rights reserved.
//

import UIKit
import MapKit

class MapDirectVC: UIViewController ,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var annotation = MKPointAnnotation()
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.requestWhenInUseAuthorization()
        mapView.delegate = self
        setMapRegion()
        mapView.showsUserLocation = true
        taipei_101set()
        mapView.setCenter(self.annotation.coordinate, animated: true)
        // Do any additional setup after loading the view.
    }
    
    func taipei_101set() {
        annotation.coordinate = CLLocationCoordinate2D(latitude: 25.033671, longitude: 121.564427)
        annotation.title = "台北101"
        mapView.addAnnotation(annotation)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let start = mapView.userLocation.coordinate
        let end = view.annotation!.coordinate
        direct(start: start, end: end)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let identifier = "annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        annotationView?.canShowCallout = true
        annotationView?.animatesDrop = true
        let directButton = UIButton(type: .detailDisclosure)
        annotationView?.rightCalloutAccessoryView = directButton
        return annotationView
    }
    func direct(start: CLLocationCoordinate2D, end: CLLocationCoordinate2D) {//導航
        let placemark_start = MKPlacemark(coordinate: start, addressDictionary: nil)
        let placemark_end = MKPlacemark(coordinate: end, addressDictionary: nil)
        
        let mapItem_start = MKMapItem(placemark: placemark_start)
        let mapItem_end = MKMapItem(placemark: placemark_end)
        
        mapItem_start.name = "My Location"
        let name = String(format: "(%.2f, %.2f)", end.latitude, end.longitude)
        mapItem_end.name = name
        
        let mapItems = [mapItem_start, mapItem_end]
        /* 設定導航模式：開車、走路、搭車 */
        let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        MKMapItem.openMaps(with: mapItems, launchOptions: options)
    }
    func setMapRegion() {
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        var region = MKCoordinateRegion()
        region.span = span
        mapView.setRegion(region, animated: true)
        mapView.regionThatFits(region)
    }

}
