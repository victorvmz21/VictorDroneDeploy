//
//  ActivityIndicator.swift
//  VIctor's_DroneDeploy_Test
//
//  Created by Victor Monteiro on 7/21/21.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.color = .white
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
