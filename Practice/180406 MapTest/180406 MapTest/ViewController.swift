//
//  ViewController.swift
//  180406 MapTest
//
//  Created by sungnni on 2018. 4. 6..
//  Copyright © 2018년 ssungnni. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var coordinateLabel: UILabel!
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 앱 켰을때부터 맵뷰를 해당 위치로 설정
        moveToInitialCoordinate(())
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            print("앱 설정을 위해서는 정보 사용 권한이 필요합니다.")
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        }
    }
    
    // MARK: Action Handler
    @IBAction private func moveToInitialCoordinate(_ sender: Any) {
        // 광화문 세종대왕 동상
        let center = CLLocationCoordinate2D(latitude: 37.572851, longitude: 126.976881)
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(center, span)
        mapView.setRegion(region, animated: true)
    }
    
    
    
    @IBAction private func startUpdatingLocation(_ sender: Any) {
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            print("앱 설정을 위해서는 정보 사용 권한이 필요합니다.")
        case .authorizedAlways, .authorizedWhenInUse:
            print("Authorized")
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
        }
        // 1회성 Location Update
        //       locationManager.requestLocation()
    }

    
    @IBAction private func stopUpdatingLocation(_ sender: Any) {
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction private func updateCurrentLocation(_ sender: Any) {
        let coordinate = mapView.centerCoordinate
        coordinateLabel.text = String(format: "위도: %2.4f, 경도: %3.4f", arguments: [coordinate.latitude, coordinate.longitude])
    }
    
    @IBAction private func addAnnotaionAtCenter(_ sender: Any) {
        let annotation = MKPointAnnotation()
        annotation.title = "MapCenter"
        annotation.coordinate = mapView.centerCoordinate
        mapView.addAnnotation(annotation)
        coordinateLabel.text = "Annotation 추가"
    }
    
    @IBAction private func addAnnotationAtNamsan(_ sender: Any) {
        let namsan = MKPointAnnotation()
        namsan.title = "남산"
        namsan.subtitle = "남산타워"
        namsan.coordinate = CLLocationCoordinate2D(latitude: 37.5514, longitude: 126.9880)
        mapView.addAnnotation(namsan)
        coordinateLabel.text = "남산 annotation 추가"
    }
    
    @IBAction private func removeAnnotation(_ sender: Any) {
        mapView.removeAnnotations(mapView.annotations)
    }
    
    
    
    
}

// MARK: - CLLocationManager
extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("\n---------- [ didUpdateLocations ] -----------\n")
        
        guard let location = locations.first else { return }
        let coordinate = location.coordinate
        coordinateLabel.text = String(format: "위도: %2.4f, 경도: %3.4f", arguments: [coordinate.latitude, coordinate.longitude])
        
        // %2.4f - 앞은 2자리, 뒤는 네자리까지 받아오기. f: float.
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\n---------- [ didFailWithError ] -----------\n")
        print(error.localizedDescription)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("\n---------- [ didChangeAuthorization ] -----------\n")
        
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("Authorized")
        default:
            print("Unauthorized")
        }
    }
}
