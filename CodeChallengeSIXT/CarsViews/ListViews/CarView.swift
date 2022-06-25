//
//  CarView.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 4/4/1401 AP.
//

import SwiftUI

struct CarView: View {
    var car: Car
    
    var body: some View {
        VStack(spacing: 1) {
            Text(car.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.white)
            
            ZStack {
                Color.white
                RemoteImage(url: car.carImageUrl, failure: Image("DefaultCarImage"))
            }
            
            HStack {
                Text(car.modelName)
                Spacer()
                Text("More Details")
                Image(systemName: "chevron.right")
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(.white)
        }
        .frame(height: 350)
        .background(Color.clear)
        .cornerRadius(8)
        .shadow(radius: 1)
    }
}
