//
//  CarListView.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/30/1401 AP.
//

import SwiftUI

struct CarListView: View {
    
    let cars: [Car]
    
    var body: some View {
        NavigationView {
            List(cars) { car in
                CarView(viewModel: CarViewModel(car: car))
                    .overlay(NavigationLink(destination: CarDetailsView(viewModel: CarDetailsViewModel(car: car))) {
                        EmptyView()
                    }.opacity(0))
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 5, leading: 1, bottom: 5, trailing: 1))
                    .listRowSeparator(.hidden)
            }
            .navigationBarTitle("Car List", displayMode: .inline)
        }
        .navigationViewStyle(.stack)
    }
}
