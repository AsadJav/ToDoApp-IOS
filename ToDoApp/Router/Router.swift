//
//  Router.swift
//  ToDoApp
//
//  Created by AALA mac on 21/11/2023.
//

import Foundation
//import UIKit
import SwiftUI
import FirebaseAuth

protocol Router {
    associatedtype Destination

    func navigate(to destination: Destination)
}

class NavigationRouter: Router {
    enum Destination {
        case register
        case back
        case home
        // Add more destinations if needed
    }

    func navigate(to destination: Destination) {
        switch destination {
        case .register:
            showRegisterView()
        case .back:
            showLoginView()
        case .home:
            showHomeView()
        }
    }

    private func showRegisterView() {
        // Navigation logic to present the RegisterView
        if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
                    keyWindow.rootViewController = UIHostingController(rootView: NavigationView {
                        RegisterView()
                    })
                }
        //NavigationLink("Create An Account", destination: RegisterView())
    }
    private func showLoginView() {
        // Navigation logic to present the RegisterView
        if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
                    keyWindow.rootViewController = UIHostingController(rootView: NavigationView {
                        LoginView()
                    })
                }
        //NavigationLink("Create An Account", destination: RegisterView())
    }
    private func showHomeView() {
        // Navigation logic to present the RegisterView
//        guard let userId = Auth.auth().currentUser?.uid else {
//            return
//        }
        if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
                    keyWindow.rootViewController = UIHostingController(rootView: NavigationView {
                        MainView()
                    })
                }
        //NavigationLink("Create An Account", destination: RegisterView())
    }
}
