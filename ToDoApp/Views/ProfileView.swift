//
//  ProfileView.swift
//  ToDoApp
//
//  Created by AALA mac on 20/11/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        
      // NavigationView {
            VStack{
                if let user = viewModel.user{
                    profile(user: user)
                    Spacer()
                }
                else{
                    Text("Loading Profile...")
                }
                
            }
            .navigationTitle("Profile")
       // }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 225,height: 225)
            .padding()
        VStack{
            HStack{
                Text("Name:")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack{
                Text("Email:")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack{
                Text("Member Since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        
        Button("Logout"){
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
