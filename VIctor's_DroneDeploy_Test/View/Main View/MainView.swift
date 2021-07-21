//
//  MainView.swift
//  VIctor's_DroneDeploy_Test
//
//  Created by Victor Monteiro on 7/21/21.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        
        NavigationView {
            
            if viewModel.isAuthenticated {
                
                HomeView(viewModel: viewModel)
                    .transition(.asymmetric(insertion: AnyTransition.opacity.combined(with: .slide), removal: .opacity))
                    .navigationBarHidden(true)
                
            } else {
                
                LoginView(viewModel: viewModel)
                    .navigationBarHidden(true)
                
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
