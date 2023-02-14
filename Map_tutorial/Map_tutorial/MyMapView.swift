//
//  MyMapView.swift
//  Map_tutorial
//
//  Created by youngjin son on 2/14/23.
//

import Foundation
import MapKit   // 맵 지도 가져올 때 씀
import SwiftUI
import CoreLocation //위치가져올때 씀

    
struct MyMapView: UIViewRepresentable {
    
    let locationManager = CLLocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        print("MyMapView - makeUIView() called")
        
        let mkMapView  = MKMapView()
        
        mkMapView.delegate = context.coordinator    //맵뷰 델리겟 연결
        
        self.locationManager.delegate = context.coordinator //위치 매니저 델리겟 연결
        
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest //위치 정확도 설정
        
        self.locationManager.requestWhenInUseAuthorization() //위치 이용 허용 물어보기
        
        self.locationManager.startUpdatingLocation()  //현재위치로 이동하겠다
        
        mkMapView.showsUserLocation = true //현재 사용자 위치 보여주기
        mkMapView.setUserTrackingMode(.follow, animated: true) //마커가 따라오는지 여부
        
        let regionRadius : CLLocationDistance = 200 //맵카메라 반경
        
        let coordinateRegion = MKCoordinateRegion(center: mkMapView.userLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius) //보여줄 지역 설정
        
        //지도의 지역 설정
        mkMapView.setRegion(coordinateRegion, animated: true)
        
        return mkMapView
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print("MyMapView - makeUIView() called")
    }
    func makeCoordinator() -> MyMapView.Coordinator {
        return MyMapView.Coordinator(self)
    }
    
    class Coordinator: NSObject {
        
        var myMapView: MyMapView    //SwiftUi view
        
        init(_ myMapView: MyMapView){
            self.myMapView = myMapView
        }
    }
}

extension MyMapView.Coordinator: MKMapViewDelegate {
    
}

extension MyMapView.Coordinator: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {  //위치가 변경되었을 때
        guard let lat = locations.first?.coordinate.latitude,
              let long = locations.first?.coordinate.longitude else{
            return
        }
        print("didUpdateLocations - 위도: \(lat), 경도: \(long)")
    }
}
