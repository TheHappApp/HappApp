//
//  SignUpView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var email: String
    @State var password: String
    var vm: AuthViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Sign Up")
                .bold()
                .font(.custom("Kollektif", size: 40))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.all)
            
            Text("Email:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .padding([.horizontal, .bottom])
                .disableAutocorrection(true)
                .autocapitalization(.none)
            
            Text("Password:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding([.horizontal, .bottom])
                .disableAutocorrection(true)
                .autocapitalization(.none)
            
            Button {
                if (email != "") && (password != "") {
                    vm.signUp(email: email, password: password)
                    presentationMode.wrappedValue.dismiss()
                }
            } label: {
                Text("Create Account")
                    .bold()
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .cornerRadius(8)
                    .foregroundColor(.primary)
            }
            .padding()

            HStack {
                Text("Already have an account?")
                NavigationLink {
                    SignInView(vm: vm,email: email, password: password)
                } label: {
                    Text("Sign In")
                        .bold()
                        .foregroundColor(.primary)
                }
            }
            
            Spacer()
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(email: "", password: "", vm: AuthViewModel())
    }
}

