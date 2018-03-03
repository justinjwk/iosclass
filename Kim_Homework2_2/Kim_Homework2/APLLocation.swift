//
//  APLLocation.swift
//  MapTest
//
//  Created by Justin Kim on 3/2/18.
//  Copyright © 2018 Justin Kim. All rights reserved.
//

import UIKit
import MapKit

class APLLocation: NSObject, MKAnnotation {

    var title:String?
    var locationName:String!
    var coordinate: CLLocationCoordinate2D
    
    init(title:String, locationName:String, coordinate: CLLocationCoordinate2D)
    {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
    }
}
