//
//  RegistrationView.swift
//  TwitterApplication
//
//  Created by Chetan Choudhary on 11/07/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var userName = ""
    @State private var fullName = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
               
                NavigationLink(destination: ProfilePhotoSelectorView(),
                               isActive: $viewModel.didAuthenticateUser,
                               label: { })
                
                AuthHeaderView(title1: "Get Started.", title2: "Create your account")
                
                VStack(spacing: 40){
                    CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                    
                    CustomInputField(imageName: "person", placeholderText: "Username", text: $userName)
                    
                    CustomInputField(imageName: "person", placeholderText: "Full Name", text: $fullName)
                    
                    CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
                }
                .padding(.vertical, 32)
                .padding(32)
                
                Button {
                    viewModel.register(withEmail: email,
                                       password: password,
                                       fullname: fullName,
                                       username: userName)
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack{
                        Text("Already have an account?")
                            .font(.footnote)
                        
                        Text("Sign In")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.bottom, 32)
                
            }
            .ignoresSafeArea()
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
