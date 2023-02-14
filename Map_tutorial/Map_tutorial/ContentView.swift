//
//  ContentView.swift
//  Map_tutorial
//
//  Created by youngjin son on 2/14/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var myPosition = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(), longitude: CLLocationDegrees()), span: MKCoordinateSpan())
    
    var body: some View {
 //       if #available(IOS 14, *) {
   //         Map(coordinateRegion: $myPosition)
     //   } else {
       //     Text("iOS 버전이 13입니다")
        //}
        MyMapView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
