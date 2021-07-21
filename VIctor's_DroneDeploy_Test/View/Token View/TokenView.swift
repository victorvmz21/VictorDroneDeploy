//
//  TokenView.swift
//  VIctor's_DroneDeploy_Test
//
//  Created by Victor Monteiro on 7/21/21.
//

import SwiftUI

struct TokenView: View {
    
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        
        VStack {
            
            Text(viewModel.getToken())
                .font(.body)
                .padding()
                .navigationBarItems(trailing:
                                        Button(action: {
                                            withAnimation(.spring()) { viewModel.logout()}
                                        }, label:{
                                            Text("Logout")
                                                .foregroundColor(.white)
                                        })
                                        .padding(6)
                                        .background(RoundedRectangle(
                                                        cornerRadius: 8.0)
                                                        .fill(Color.blue)
                                        )
                )
            
        }
       
    }
    
}

struct TokenView_Previews: PreviewProvider {
    static var previews: some View {
        TokenView(viewModel: UserViewModel())
    }
}

