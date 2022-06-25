//
//  RemoteImage.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/31/1401 AP.
//

import SwiftUI

struct RemoteImage: View {
    private enum LoadState {
        case loading, success, failure
    }

    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading

        init(url: URL) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }

                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
        }
    }

    @StateObject private var loader: Loader
    var failure: Image

    var body: some View {
        if loader.state == .loading {
            ProgressView()
        } else {
            selectImage()
                .resizable()
        }
    }

    init(url: URL, failure: Image = Image("DefaultCarImage")) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.failure = failure
    }

    private func selectImage() -> Image {
        switch loader.state {
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}
