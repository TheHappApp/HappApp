//
//  FirebaseService.swift
//  HappApp
//
//  Created by Turner White on 9/28/22.
//

import Foundation

import FirebaseAuth
import Firebase
import CoreLocation
import MapKit

class AuthViewModel: ObservableObject {
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self]
            result, error in
            guard result != nil, error == nil else {
                return
            }
            
            //Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self]
            result, error in
            guard result != nil, error == nil else {
                return
            }
            
            //Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
    }
    
}

class firestoreManager: ObservableObject{
    
    init() {
        getAllEventData()
    }
    
    @Published var clubEventList = [Event]()
    @Published var concertEventList = [Event]()
    @Published var partyEventList = [Event]()
    @Published var companyEventList = [Event]()
    @Published var speakerEventList = [Event]()
    @Published var sportEventList = [Event]()
    @Published var foodEventList = [Event]()
    @Published var religiousEventList = [Event]()
    @Published var generalEventList = [Event]()

    @Published var eventLocationList = [CLLocationCoordinate2D]()
    
    func getClubEventData() {
        let db = Firestore.firestore()
        //for category in EventCategory.allCases {
        db.collection("globalEvents").document("clubEvents").collection("eventList").getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                DispatchQueue.main.async {
                    self.clubEventList = snapshot.documents.map { d in
                        let position = d["eventLocation"] as? GeoPoint
                        let eventLocation = CLLocation(latitude: position?.latitude ?? 39.0, longitude: position?.longitude ?? -78.0)
                        let newEvent = Event(eventTitle: d["eventTitle"] as? String ?? "",
                                             eventDesc: d["eventDesc"] as? String ?? "",
                                             eventHost: d["eventHost"] as? String ?? "",
                                             eventLocation: eventLocation,
                                             eventCategory: d["eventCategory"] as? EventCategory ?? EventCategory.clubEvent,
                                             numAttending: d["numAttending"] as? Int ?? 0,
                                             startTime: Date(timeIntervalSince1970: d["startTime"] as? Double ?? 0.0),
                                             endTime: Date(timeIntervalSince1970: d["endTime"] as? Double ?? 0.0),
                                             eventAddress: d["eventAddress"] as? String ?? "")
                        //print("success")
                        return newEvent
                    }
                }
                
            }
            
            
        }
    }
    func getConcertEventData() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("concertEvents").collection("eventList").getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                DispatchQueue.main.async {
                    self.concertEventList = snapshot.documents.map { d in
                        let position = d["eventLocation"] as? GeoPoint
                        let eventLocation = CLLocation(latitude: position?.latitude ?? 39.0, longitude: position?.longitude ?? -78.0)
                        let newEvent = Event(eventTitle: d["eventTitle"] as? String ?? "",
                                             eventDesc: d["eventDesc"] as? String ?? "",
                                             eventHost: d["eventHost"] as? String ?? "",
                                             eventLocation: eventLocation,
                                             eventCategory: d["eventCategory"] as? EventCategory ?? EventCategory.concertEvent,
                                             numAttending: d["numAttending"] as? Int ?? 0,
                                             startTime: Date(timeIntervalSince1970: d["startTime"] as? Double ?? 0.0),
                                             endTime: Date(timeIntervalSince1970: d["endTime"] as? Double ?? 0.0),
                                             eventAddress: d["eventAddress"] as? String ?? "")
                        //print("success")
                        return newEvent
                    }
                }
                
            }
            
            
        }
    }
    func getGeneralEventData() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("generalEvents").collection("eventList").getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                DispatchQueue.main.async {
                    self.generalEventList = snapshot.documents.map { d in
                        let position = d["eventLocation"] as? GeoPoint
                        let eventLocation = CLLocation(latitude: position?.latitude ?? 39.0, longitude: position?.longitude ?? -78.0)
                        let newEvent = Event(eventTitle: d["eventTitle"] as? String ?? "",
                                             eventDesc: d["eventDesc"] as? String ?? "",
                                             eventHost: d["eventHost"] as? String ?? "",
                                             eventLocation: eventLocation,
                                             eventCategory: d["eventCategory"] as? EventCategory ?? EventCategory.generalEvent,
                                             numAttending: d["numAttending"] as? Int ?? 0,
                                             startTime: Date(timeIntervalSince1970: d["startTime"] as? Double ?? 0.0),
                                             endTime: Date(timeIntervalSince1970: d["endTime"] as? Double ?? 0.0),
                                             eventAddress: d["eventAddress"] as? String ?? "")
                        //print("success")
                        return newEvent
                    }
                }
                
            }
            
            
        }
    }
    func getPartyEventData() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("partyEvents").collection("eventList").getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                DispatchQueue.main.async {
                    self.partyEventList = snapshot.documents.map { d in
                        let position = d["eventLocation"] as? GeoPoint
                        let eventLocation = CLLocation(latitude: position?.latitude ?? 39.0, longitude: position?.longitude ?? -78.0)
                        let newEvent = Event(eventTitle: d["eventTitle"] as? String ?? "",
                                             eventDesc: d["eventDesc"] as? String ?? "",
                                             eventHost: d["eventHost"] as? String ?? "",
                                             eventLocation: eventLocation,
                                             eventCategory: d["eventCategory"] as? EventCategory ?? EventCategory.partyEvent,
                                             numAttending: d["numAttending"] as? Int ?? 0,
                                             startTime: Date(timeIntervalSince1970: d["startTime"] as? Double ?? 0.0),
                                             endTime: Date(timeIntervalSince1970: d["endTime"] as? Double ?? 0.0),
                                             eventAddress: d["eventAddress"] as? String ?? "")
                        //print("success")
                        return newEvent
                    }
                }
                
            }
            
            
        }
    }
    func getCompanyEventData() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("companyEvents").collection("eventList").getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                DispatchQueue.main.async {
                    self.companyEventList = snapshot.documents.map { d in
                        let position = d["eventLocation"] as? GeoPoint
                        let eventLocation = CLLocation(latitude: position?.latitude ?? 39.0, longitude: position?.longitude ?? -78.0)
                        let newEvent = Event(eventTitle: d["eventTitle"] as? String ?? "",
                                             eventDesc: d["eventDesc"] as? String ?? "",
                                             eventHost: d["eventHost"] as? String ?? "",
                                             eventLocation: eventLocation,
                                             eventCategory: d["eventCategory"] as? EventCategory ?? EventCategory.companyEvent,
                                             numAttending: d["numAttending"] as? Int ?? 0,
                                             startTime: Date(timeIntervalSince1970: d["startTime"] as? Double ?? 0.0),
                                             endTime: Date(timeIntervalSince1970: d["endTime"] as? Double ?? 0.0),
                                             eventAddress: d["eventAddress"] as? String ?? "")
                        //print("success")
                        return newEvent
                    }
                }
                
            }
            
            
        }
    }
    func getSpeakerEventData() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("speakerEvents").collection("eventList").getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                DispatchQueue.main.async {
                    self.speakerEventList = snapshot.documents.map { d in
                        let position = d["eventLocation"] as? GeoPoint
                        let eventLocation = CLLocation(latitude: position?.latitude ?? 39.0, longitude: position?.longitude ?? -78.0)
                        let newEvent = Event(eventTitle: d["eventTitle"] as? String ?? "",
                                             eventDesc: d["eventDesc"] as? String ?? "",
                                             eventHost: d["eventHost"] as? String ?? "",
                                             eventLocation: eventLocation,
                                             eventCategory: d["eventCategory"] as? EventCategory ?? EventCategory.speakerEvent,
                                             numAttending: d["numAttending"] as? Int ?? 0,
                                             startTime: Date(timeIntervalSince1970: d["startTime"] as? Double ?? 0.0),
                                             endTime: Date(timeIntervalSince1970: d["endTime"] as? Double ?? 0.0),
                                             eventAddress: d["eventAddress"] as? String ?? "")
                        //print("success")
                        return newEvent
                    }
                }
                
            }
            
            
        }
    }
    func getSportEventData() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("sportEvents").collection("eventList").getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                DispatchQueue.main.async {
                    self.sportEventList = snapshot.documents.map { d in
                        let position = d["eventLocation"] as? GeoPoint
                        let eventLocation = CLLocation(latitude: position?.latitude ?? 39.0, longitude: position?.longitude ?? -78.0)
                        let newEvent = Event(eventTitle: d["eventTitle"] as? String ?? "",
                                             eventDesc: d["eventDesc"] as? String ?? "",
                                             eventHost: d["eventHost"] as? String ?? "",
                                             eventLocation: eventLocation,
                                             eventCategory: d["eventCategory"] as? EventCategory ?? EventCategory.sportEvent,
                                             numAttending: d["numAttending"] as? Int ?? 0,
                                             startTime: Date(timeIntervalSince1970: d["startTime"] as? Double ?? 0.0),
                                             endTime: Date(timeIntervalSince1970: d["endTime"] as? Double ?? 0.0),
                                             eventAddress: d["eventAddress"] as? String ?? "")
                        //print("success")
                        return newEvent
                    }
                }
                
            }
            
            
        }
    }
    func getFoodEventData() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("foodEvents").collection("eventList").getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                DispatchQueue.main.async {
                    self.foodEventList = snapshot.documents.map { d in
                        let position = d["eventLocation"] as? GeoPoint
                        let eventLocation = CLLocation(latitude: position?.latitude ?? 39.0, longitude: position?.longitude ?? -78.0)
                        let newEvent = Event(eventTitle: d["eventTitle"] as? String ?? "",
                                             eventDesc: d["eventDesc"] as? String ?? "",
                                             eventHost: d["eventHost"] as? String ?? "",
                                             eventLocation: eventLocation,
                                             eventCategory: d["eventCategory"] as? EventCategory ?? EventCategory.foodEvent,
                                             numAttending: d["numAttending"] as? Int ?? 0,
                                             startTime: Date(timeIntervalSince1970: d["startTime"] as? Double ?? 0.0),
                                             endTime: Date(timeIntervalSince1970: d["endTime"] as? Double ?? 0.0),
                                             eventAddress: d["eventAddress"] as? String ?? "")
                        //print("success")
                        return newEvent
                    }
                }
                
            }
            
            
        }
    }
    func getReligiousEventData() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("religiousEvents").collection("eventList").getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                DispatchQueue.main.async {
                    self.religiousEventList = snapshot.documents.map { d in
                        let position = d["eventLocation"] as? GeoPoint
                        let eventLocation = CLLocation(latitude: position?.latitude ?? 35.0, longitude: position?.longitude ?? -79.0)
                        let newEvent = Event(eventTitle: d["eventTitle"] as? String ?? "",
                                             eventDesc: d["eventDesc"] as? String ?? "",
                                             eventHost: d["eventHost"] as? String ?? "",
                                             eventLocation: eventLocation,
                                             eventCategory: d["eventCategory"] as? EventCategory ?? EventCategory.religiousEvent,
                                             numAttending: d["numAttending"] as? Int ?? 0,
                                             startTime: Date(timeIntervalSince1970: d["startTime"] as? Double ?? 0.0),
                                             endTime: Date(timeIntervalSince1970: d["endTime"] as? Double ?? 0.0),
                                             eventAddress: d["eventAddress"] as? String ?? "")
                        //print("success")
                        return newEvent
                    }
                }
                
            }
            
            
        }
    }
    func getAllEventData() {
        getClubEventData()
        getConcertEventData()
        getPartyEventData()
        getGeneralEventData()
        getCompanyEventData()
        getSpeakerEventData()
        getSportEventData()
        getFoodEventData()
        getReligiousEventData()
    }
    
    
    func addEvent(event: Event) {
        guard let userID = Auth.auth().currentUser?.uid else {return}
        let db = Firestore.firestore()
        db.collection("globalEvents").document("\(event.eventCategory.rawValue)s").collection("eventList")
            .addDocument(data: ["endTime":event.endTime.timeIntervalSince1970,
                                "eventCategory":event.eventCategory.rawValue,
                                "eventDesc":event.eventDesc,
                                "eventHost":userID,
                                "eventLocation":GeoPoint(latitude:event.eventLocation.coordinate.latitude,longitude: event.eventLocation.coordinate.longitude),
                                "eventTitle":event.eventTitle,
                                "numAttending":event.numAttending,
                                "startTime":event.startTime.timeIntervalSince1970,
                                "eventAddress":event.eventAddress
                               ]) { error in
                if error == nil {
                    self.getAllEventData()
                }
            }
        
    }
    
    func rsvp(event: Event) {
        let db = Firestore.firestore()
        let newNum = event.numAttending + 1
        db.collection("globalEvents").document("\(event.eventCategory)").collection("eventList").document(event.id).setData(["numAttending": newNum], merge: true) { error in
            if let error = error {
                print(error.localizedDescription)
                return
        }
            self.getAllEventData()
            
        }
    }
    
    func unrsvp(event: Event) {
        let db = Firestore.firestore()
        if event.numAttending == 0 {
            return
        }
        let newNum = event.numAttending - 1
        db.collection("globalEvents").document("\(event.eventCategory)").collection("eventList").document(event.id).setData(["numAttending": newNum], merge: true) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.getAllEventData()
        }
    }
}
