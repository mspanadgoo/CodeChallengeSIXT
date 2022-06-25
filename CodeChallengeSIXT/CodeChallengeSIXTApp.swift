//
//  CodeChallengeSIXTApp.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/30/1401 AP.
//

import SwiftUI

@main
struct CodeChallengeSIXTApp: App {
    
    @ObservedObject var viewModel = CarsViewModel(carDataProvider: CarDataProviderImp(carServices: CarServicesImp()))
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                switch viewModel.state {
                case.ready:
                    TabView {
                        CarsOnMapView(cars: viewModel.cars)
                            .tabItem {
                                Label(viewModel.mapTabTitle, systemImage: "mappin")
                            }

                        CarListView(cars: viewModel.cars)
                            .tabItem {
                                Label(viewModel.listTabTitle, systemImage: "list.bullet")
                            }
                    }
                case .loading:
                    ProgressView()
                case .error(let error):
                    Text(error.localizedDescription)
                }
            }
            .onAppear {
                if viewModel.cars.isEmpty {
                    viewModel.fetchCars()
                }
            }
        }
    }
}
