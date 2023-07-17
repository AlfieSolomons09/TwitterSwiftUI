//
//  TwitterApplicationApp.swift
//  TwitterApplication
//
//  Created by Chetan Choudhary on 09/07/23.
//

import SwiftUI
import Firebase

@main
struct TwitterApplicationApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
