//
//  SignInView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var vm: AuthViewModel
    @State var email: String
    @State var password: String
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Sign In")
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

            HStack {
                Text("Forgot Password?")
                    .padding(.horizontal)
                Button(action: {vm.signIn(email: email, password: password)}) {
                        Text("Login")
                            .bold()
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .cornerRadius(8)
                            .foregroundColor(.primary)
                }
            }
            .padding()

            HStack {
                Text("Don't have an account?")
                Button(action: {presentationMode.wrappedValue.dismiss()}) {
                    Text("Create one")
                        .bold()
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .cornerRadius(8)
                        .foregroundColor(.primary)
                }
            }
            
            Spacer()
            
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(vm: AuthViewModel(), email: "", password: "")
    }
}
