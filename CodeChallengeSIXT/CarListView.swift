//
//  CarListView.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/30/1401 AP.
//

import SwiftUI

struct CarListView: View {
    @ObservedObject var carsViewModel = CarsViewModel()
    
    var body: some View {
        NavigationView {
            List(carsViewModel.cars) { car in
                CarView(car: car)
                    .overlay(NavigationLink(destination: CarDetailView(car: car)) {
                        EmptyView()
                    }.opacity(0))
                    .listRowInsets(EdgeInsets(top: 8, leading: 1, bottom: 8, trailing: 1))
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)

            }
            .navigationBarTitle("Car List", displayMode: .inline)
            .onAppear {
                carsViewModel.fetchCars()
            }
        }
    }
}
