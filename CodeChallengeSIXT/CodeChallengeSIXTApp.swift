//
//  CodeChallengeSIXTApp.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/30/1401 AP.
//

import SwiftUI

@main
struct CodeChallengeSIXTApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {

                CarsOnMapView()
                    .tabItem {
                        Label("Map", systemImage: "mappin")
                    }

                CarListView()
                    .tabItem {
                        Label("Car List", systemImage: "list.bullet")
                    }
            }
        }
    }
}
