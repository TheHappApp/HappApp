//
//  Profile.swift
//  HappApp
//
//  Created by Turner White on 9/28/22.
//

import Foundation

struct ProfileDataStore {
    static private let defaults = UserDefaults(suiteName: "group.com.turner-white.HappApp")!
    //Save the user's authentication email in userdefaults
    static let nameKey = "name"
    //Save the user's password in userdefaults
    static let instaHandleKey = "insta"
    
    static func saveName(string: String) {
        defaults.set(string, forKey: nameKey)
    }
    
    static func fetchName() -> String {
        guard let ret = defaults.string(forKey: nameKey) else {return "First Last"}
        return ret
    }
    
    static func saveInsta(string: String)  {
        defaults.set(string, forKey: instaHandleKey)
    }
    static func fetchInsta() -> String {
        guard let ret = defaults.string(forKey: instaHandleKey) else {return "@insta"}
        return ret
    }
}

class Profile {
    //var firstname: String
    //var lastname: String
    var name: String = ""
    var instaHandle: String = ""
}
