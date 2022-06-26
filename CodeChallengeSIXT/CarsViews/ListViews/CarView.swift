//
//  CarView.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 4/4/1401 AP.
//

import SwiftUI

struct CarView: View {
    @Environment(\.colorScheme) var colorScheme

    var viewModel: CarViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.name)
                .font(.title)
                .padding()
            
            Divider()
            
            RemoteImage(url: viewModel.carImageUrl, failure: Image("DefaultCarImage"))
                .frame(height: 250)
            
            Divider()
            
            HStack {
                Text(viewModel.modelName)
                Spacer()
                Text("More Details")
                Image(systemName: "chevron.right")
            }
            .padding()
        }
        .background(colorScheme == .dark ? .gray : .white)
        .cornerRadius(8)
        .shadow(radius: 1)
    }
}
