//
//  LoginView.swift
//  ToDoApp
//
//  Created by AALA mac on 20/11/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        //NavigationView {
            VStack{
                
                //Header
                HeaderView(title: "To Do List", subTitle: "Get Things Done", angle: 15, backgroundColor: .pink)
                
                //Form
                
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title: "Login", background: .blue) {
                        viewModel.login()
                    }
                    .padding()
                    
                }
                .offset(y:-50)
                
                //CreateAccount
                VStack{
                    Text("New Around Here?")
                    Button("Create An Account") {
                        viewModel.navigateToRegisterScreen()
                    }
                }
                .padding(.bottom,20)
                
                
                Spacer()
        }

            //}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
