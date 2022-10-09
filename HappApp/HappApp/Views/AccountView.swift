//
//  AccountView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
//

import SwiftUI

struct AccountView: View {
    var vm: AuthViewModel
    @StateObject var avm = AccountViewModel()
    var body: some View {
        VStack(alignment: .center) {
            Image("profile")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 120, alignment: .center)
            .clipShape(Circle())
            .padding(.top)
            
            Text(avm.name)
                .font(.title)
                .bold()
            
            Text(avm.instaHandle)
                .padding(.bottom)
            
                
            NavigationLink {
                ProfileEditView(avm: avm)
            } label: {
                Text("Edit Profile")
                    .foregroundColor(.blue)
            }

            
            Divider()
            
                Text("Your Saved Events")
                    .font(.title3)
                    .frame(maxWidth: .infinity, maxHeight: .zero, alignment: .leading)
                    .padding()
            
                Text("No Saved Events")
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, maxHeight: .zero, alignment: .leading)
                    .padding()
            
            Spacer()
            
            Divider()
            
            Button(action: {vm.signOut()}) {
                Text("Sign Out")
                    .bold()
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .cornerRadius(8)
                    .foregroundColor(.red)
            }
        }.onAppear {
            avm.ref()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(vm: AuthViewModel())
    }
}

