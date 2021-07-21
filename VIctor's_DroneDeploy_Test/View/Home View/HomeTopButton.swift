//
//  HomeTopButton.swift
//  VIctor's_DroneDeploy_Test
//
//  Created by Victor Monteiro on 7/21/21.
//

import SwiftUI

struct HomeTopButton: View {
    
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        
        HStack{
            
            Spacer()
            
            Button(action: {
                withAnimation(.spring()) { self.viewModel.logout()}
            }, label: {
                Text("Logout")
                    .foregroundColor(.white)
            })
            .padding(6)
            .background(RoundedRectangle(cornerRadius: 6.0)
                                         .fill(Color.blue)
            )
            .padding(.trailing, 20)
            
        }
    }
    
}

struct HomeTopButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopButton(viewModel: UserViewModel())
    }
}

