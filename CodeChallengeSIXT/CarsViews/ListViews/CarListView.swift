//
//  CarListView.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/30/1401 AP.
//

import SwiftUI

struct CarListView: View {

    var body: some View {
        NavigationView {
            List(carsViewModel.cars) { car in
                CarView(car: car)
                    .overlay(NavigationLink(destination: CarDetailsView(viewModel: CarDetailsViewModel(car: car))) {
                        EmptyView()
                    }.opacity(0))
                    .listRowInsets(EdgeInsets(top: 8, leading: 1, bottom: 8, trailing: 1))
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)

            }
            .navigationBarTitle("Car List", displayMode: .inline)
        }
    }
}
