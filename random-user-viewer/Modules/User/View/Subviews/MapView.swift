//
//  MapView.swift
//  random-user-viewer
//
//  Created by Ricardo Ramirez on 29/03/21.
//

import UIKit
import MapKit

class MapView: UIView {
    
    let mapView = MKMapView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        activateConstraints()
    }
    
    func setupUI() {
        addSubview(mapView)
    }
    
    func activateConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func centerMapOn(latitude: Double, longitude: Double) {
        let ratioInMeters = CLLocationDistance(5000)
        let coordinateRegion = MKCoordinateRegion(
            center: CLLocation(latitude: latitude, longitude: longitude).coordinate,
            latitudinalMeters: ratioInMeters,
            longitudinalMeters: ratioInMeters
        )
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
}
