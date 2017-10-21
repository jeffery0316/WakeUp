//
//  WUMapViewController.swift
//  WakeUp
//
//  Created by JefferyKao on 2017/10/21.
//  Copyright © 2017年 kkbox. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

final class WUMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
{
	let navigator: AppNavigator
	let locationManager = CLLocationManager()
	var mapView: MKMapView!

	init() {
		let navController = UINavigationController.init()
		navigator = AppNavigator.init(navigationController: navController)
		super.init(nibName: nil, bundle: nil)
		self.configureMap()
	}

	init(navigator: AppNavigator) {
		self.navigator = navigator
		super.init(nibName: nil, bundle: nil)
		self.configureMap()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		self.configureLocation()
	}

	func configureMap() {
		mapView = MKMapView.init()
		mapView.delegate = self
		mapView.showsUserLocation = true
		mapView.userTrackingMode = .follow
		mapView.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(mapView)
		NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[mapView]|", options: [], metrics: nil, views: ["mapView": mapView]))
		NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[mapView]|", options: [], metrics: nil, views: ["mapView": mapView]))

		locationManager.delegate = self
		locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
	}

	func configureLocation() {
		if CLLocationManager.authorizationStatus() == .notDetermined {
			locationManager.requestAlwaysAuthorization()
		}

		else if CLLocationManager.authorizationStatus() == .denied {
			print("Location services were previously denied. Please enable location services for this app in Settings.")
		}

		else if CLLocationManager.authorizationStatus() == .authorizedAlways {
			locationManager.startUpdatingLocation()
		}
	}
}
