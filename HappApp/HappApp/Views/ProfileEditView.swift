//
//  ProfileEditView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
//

import SwiftUI

struct ProfileEditView: View {
    
    @State var name: String = ""
    @State var instagram: String = ""
    var avm: AccountViewModel
    
    var body: some View {
        VStack {
            Text("Enter your name:")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                .padding(.horizontal)
                .padding(.bottom, 5.0)
                .foregroundColor(.gray)
            
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding([.horizontal, .bottom])
                .disableAutocorrection(true)
                .autocapitalization(.none)
            
            Text("Link your Instagram")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                .padding(.horizontal)
                .padding(.bottom, 5.0)
                .foregroundColor(.gray)
            
            TextField("Instagram", text: $instagram)
                .textFieldStyle(.roundedBorder)
                .padding([.horizontal, .bottom])
                .disableAutocorrection(true)
                .autocapitalization(.none)
            
            Button {
                avm.changeName(newName: name)
                avm.changeInsta(newInsta: instagram)
            } label: {
                Text("Save Changes")
            }
            Spacer()
        }
        .navigationTitle("Edit Profile")
    }
}

struct ProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditView(avm: AccountViewModel())
    }
}

