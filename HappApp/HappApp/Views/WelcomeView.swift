//
//  WelcomeView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
//

import SwiftUI

struct WelcomeView: View {
    var vm: AuthViewModel
    var body: some View {
        VStack {
            Spacer()
            
            Text("Happ")
                .font(.custom("Kollektif", size: 70))
                .padding(.vertical, 50)
            
            NavigationLink {
                SignUpView(email: "", password: "",vm: vm)
            } label: {
                Text("Get Started")
                    .font(.custom("Kollektif", size: 20))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .foregroundColor(.primary)
                    .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.primary, lineWidth: 1)
                                    .frame(width: 200)
                            )
            }.buttonStyle(PlainButtonStyle())

            Spacer()
            
            Text("Stay Updated On Events Happening Near You")
                .font(.custom("Kollektif-Italic", size: 15))
                .fontWeight(.thin)
                .padding(.vertical, 50)
            
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(vm: AuthViewModel())
    }
}
