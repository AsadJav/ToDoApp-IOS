//
//  RegisterView.swift
//  ToDoApp
//
//  Created by AALA mac on 20/11/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
            VStack{
                HeaderView(title: "Register", subTitle: "Start Organizing Things", angle: -15, backgroundColor: .orange)
                
                Form{
                    TextField("Name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title: "Create Account", background: .green) {
                        viewModel.Register()
                    }
                    .padding()
                    
                }
                .offset(y:-50)
                
                VStack{
                    Text("Already have an Account ?")
                    Button("Sign-In") {
                        viewModel.navigateToLogin()
                    }
                }
                .padding(.bottom,20)
                
                Spacer()
            }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
