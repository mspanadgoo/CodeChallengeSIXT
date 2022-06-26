//
//  FakeCarDataProviderDelegate.swift
//  CodeChallengeSIXTTests
//
//  Created by Mohammad Sadegh Panadgoo on 4/6/1401 AP.
//

import Foundation
@testable import CodeChallengeSIXT

class FakeCarDataProviderDelegate: CarDataProviderDelegate {
    var onStateChanged: ((CarDataProviderState) -> Void)?
    func carDataProviderStateChanged(state: CarDataProviderState) {
        onStateChanged?(state)
    }
}
