//
//  ViewController.swift
//  MapTest
//
//  Created by Justin Kim on 3/2/18.
//  Copyright © 2018 Justin Kim. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate {


    @IBOutlet weak var mkView: MKMapView!
    @IBOutlet weak var snapshotImageView: UIImageView!
    
    let locationManager = CLLocationManager()
    let regionRadius:CLLocationDistance = 1000.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.requestWhenInUseAuthorization()
        mkView.delegate = self
        mkView.showsUserLocation = true
        
        let location = CLLocation(latitude: 39.1602, longitude: -76.899872)
        let building200Location = APLLocation(title: "Building 200", locationName: "South Campus", coordinate: CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude))
        
        mkView.addAnnotation(building200Location)
        
        centerMapOnLocation(location: location)
        
        
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius*2.0, regionRadius*2.0)
        mkView.setRegion(coordinateRegion, animated: true)
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? APLLocation
        {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin") as? MKPinAnnotationView
            {
                dequeuedView.annotation = annotation
                view = dequeuedView
            }
            else
            {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            return view
        }
        return nil
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func requestSnapshotData(mapView: MKMapView, completion: @escaping (NSData?, NSError?) -> ())
    {
        let options = MKMapSnapshotOptions()
        options.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(20, -70), MKCoordinateSpanMake(3, 3))
        options.size = mapView.frame.size
        options.scale = UIScreen.main.scale
        
        let snapshotter = MKMapSnapshotter(options: options)
        snapshotter.start()
        {
            snapshot, error in
            
            let image = snapshot!.image
            let data = UIImagePNGRepresentation(image)
            completion(data as NSData?, nil)
        }
    }
    
    
    @IBAction func snapshotButtonPressed(_ sender: Any) {
        
        self.requestSnapshotData(mapView: mkView, completion:
        {
            (data, error) in
            
            let image = UIImage(data: data as! Data)
            self.snapshotImageView.image = image
        })
        
        
    }
    
}

