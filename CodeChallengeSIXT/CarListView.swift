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
                VStack(spacing: 0.8) {
                    Text(car.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.white)
                    
                    ZStack {
                        Color.white
                        RemoteImage(url: car.carImageUrl)
                    }
                    
                    HStack {
                        Text(car.name)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .background(.white)
                }
                .frame(height: 300)
                .background(Color.clear)
                .cornerRadius(8)
                .shadow(radius: 1)
            }
            .onAppear {
                carsViewModel.fetchCars()
            }
        }
    }
}
