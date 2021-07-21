//
//  HomeMainButtonView.swift
//  VIctor's_DroneDeploy_Test
//
//  Created by Victor Monteiro on 7/21/21.
//

import SwiftUI

struct HomeMainButtonView: View {
   
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        
        HStack {
            
            NavigationLink(destination: TokenView(viewModel: viewModel)) {
                Text("Go to tokens screen")
                    .foregroundColor(.white)
            }
            .padding(6)
            .background(RoundedRectangle(cornerRadius: 6.0)
                                         .fill(Color.blue)
            )
            
        }
        
    }
    
}

struct HomeMainButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMainButtonView(viewModel: UserViewModel())
    }
}
