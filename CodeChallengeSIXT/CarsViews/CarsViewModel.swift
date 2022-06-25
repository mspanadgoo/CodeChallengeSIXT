//
//  CarsViewModel.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/30/1401 AP.
//

import SwiftUI
import Combine

class CarsViewModel: ObservableObject {
    private var task: AnyCancellable?
    
    @Published var cars: [Car] = []
    
}
