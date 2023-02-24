//
//  MapViewController.swift
//  RecipesApp
//
//  Created by Abraham Escamilla Pinelo on 23/02/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    //MARK: - UI
    private let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        
        return map
    }()
    
    //MARK: - Variables
    var locationManager: CLLocationManager!
    var recipeDetailViewModel: RecipeDetailViewModel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupMapView()
        self.setupLocationManager()
    }
    
    
    private func setupLocationManager() {
        self.locationManager = CLLocationManager()
        self.locationManager.requestWhenInUseAuthorization()
        guard let coordinate = self.recipeDetailViewModel.mealLocation else { return }
        self.mapView.setCenter(coordinate, animated: true)
        
        self.mapView.addAnnotation(self.recipeDetailViewModel.getMealAnnotation())
    }
    
    private func setupMapView() {
        self.view.addSubview(self.mapView)
        
        self.mapView.delegate = self
        self.mapView.showsUserLocation = true
        
        self.mapView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor).isActive = true
        self.mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}

extension MapViewController: MKMapViewDelegate {
    
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            print("Not determined")
        case .restricted:
            print("Restricted")
        case .denied:
            print("Denied")
        case .authorizedAlways:
            print("Authorized Always")
        case .authorizedWhenInUse:
            print("Authorized When in Use")
        @unknown default:
            print("Unknown status")
        }
    }
}
