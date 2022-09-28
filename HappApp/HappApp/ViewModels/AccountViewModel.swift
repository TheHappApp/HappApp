//
//  AccountViewModel.swift
//  HappApp
//
//  Created by Turner White on 9/28/22.
//

import Foundation

final class AccountViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var instaHandle: String = ""
    
    init() {
        name = ProfileDataStore.fetchName()
        instaHandle = ProfileDataStore.fetchInsta()
    }
    
    func changeName(newName: String) {
        ProfileDataStore.saveName(string: newName)
    }
    
    func changeInsta(newInsta: String) {
        ProfileDataStore.saveInsta(string: newInsta)
    }
    func ref() {
        self.name = ProfileDataStore.fetchName()
        self.instaHandle = ProfileDataStore.fetchInsta()
    }
}
