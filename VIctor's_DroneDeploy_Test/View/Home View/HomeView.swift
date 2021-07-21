//
//  HomeView.swift
//  VIctor's_DroneDeploy_Test
//
//  Created by Victor Monteiro on 7/21/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
            
            VStack {
                
                HomeTopButton(viewModel: viewModel)
                
                Text("Welcome")
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                Text(viewModel.getuserName())
                    .font(.title)
                
                Spacer()
            
                HomeMainButtonView(viewModel: viewModel)
                
                Spacer()
                
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: UserViewModel())
    }
}
