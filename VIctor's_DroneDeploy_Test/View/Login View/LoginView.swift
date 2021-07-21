//
//  LoginView.swift
//  VIctor's_DroneDeploy_Test
//
//  Created by Victor Monteiro on 7/21/21.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        
        VStack(spacing: 40) {
            Text("Welcome")
                .font(.title)
            LoginTextFieldView(viewModel: viewModel)
        }
        .frame(maxHeight: .infinity)
        .background(Color.white)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: UserViewModel())
    }
}
