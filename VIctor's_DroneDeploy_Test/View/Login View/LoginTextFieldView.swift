//
//  LoginTextFieldView.swift
//  VIctor's_DroneDeploy_Test
//
//  Created by Victor Monteiro on 7/21/21.
//

import SwiftUI

struct LoginTextFieldView: View {
    
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 8) {
            
            TextField("E-mail", text: $viewModel.email)
                .font(.body)
                .padding(8)
                .foregroundColor(.gray)
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.gray, lineWidth: 3)
                )
            
            SecureField("Password", text: $viewModel.password)
                .font(.body)
                .padding(8)
                .foregroundColor(.gray)
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.gray, lineWidth: 3)
                )
            
            Button(action: {
               
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                
                if !viewModel.email.isEmpty && !viewModel.password.isEmpty {
                    
                    self.viewModel.isLoadingScreen = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        viewModel.login(email: viewModel.email,
                                        password: viewModel.password)
                    }
                    
                } else {
                    self.viewModel.isGettingError = true
                }
                
            }, label:{
                if self.viewModel.isLoadingScreen {
                    
                    ActivityIndicator(isAnimating: $viewModel.isLoadingScreen, style: .medium)
                        .foregroundColor(.white)
                    
                } else {
                    
                    Text("Login")
                        .font(.title)
                        .padding(8)
                        .foregroundColor(.white)
                }
            })
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.blue)
            )
            .alert(isPresented: $viewModel.isGettingError){
              
                Alert(title: Text("Error"), message: Text(viewModel.ErrorHandling()), dismissButton: .default(Text("Dismiss")))
            }
            
            
        }
        .padding(.horizontal, 20)
    }
    
}

struct LoginTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextFieldView(viewModel: UserViewModel())
            .previewLayout(.sizeThatFits)
    }
}
