//
//  SearchViewModel.swift
//  HappApp
//
//  Created by Turner White on 9/28/22.
//

import Foundation
import Firebase
import MapKit

final class SearchViewModel: ObservableObject {
    @Published var clubEventList = [Event]()
    @Published var concertEventList = [Event]()
    @Published var partyEventList = [Event]()
    @Published var generalEventList = [Event]()
    @Published var companyEventList = [Event]()
    @Published var speakerEventList = [Event]()
    @Published var sportEventList = [Event]()
    @Published var foodEventList = [Event]()
    @Published var religiousEventList = [Event]()
    
    func getClubEventList() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("clubEvents").collection("eventList").getDocuments {snapshot, error in
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
    func getConcertEventList() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("concertEvents").collection("eventList").getDocuments {snapshot, error in
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
    func getPartyEventList() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("partyEvents").collection("eventList").getDocuments {snapshot, error in
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
    func getGeneralEventList() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("generalEvents").collection("eventList").getDocuments {snapshot, error in
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
    func getCompanyEventList() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("companyEvents").collection("eventList").getDocuments {snapshot, error in
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
    func getSpeakerEventList() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("speakerEvents").collection("eventList").getDocuments {snapshot, error in
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
    func getSportEventList() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("sportEvents").collection("eventList").getDocuments {snapshot, error in
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
    func getFoodEventList() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("foodEvents").collection("eventList").getDocuments {snapshot, error in
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
    func getReligiousEventList() {
        let db = Firestore.firestore()
        db.collection("globalEvents").document("religiousEvents").collection("eventList").getDocuments {snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                DispatchQueue.main.async {
                    self.religiousEventList = snapshot.documents.map { d in
                        let position = d["eventLocation"] as? GeoPoint
                        let eventLocation = CLLocation(latitude: position?.latitude ?? 39.0, longitude: position?.longitude ?? -78.0)
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
    func getAllEventLists() {
        getConcertEventList()
        getGeneralEventList()
        getPartyEventList()
        getCompanyEventList()
        getClubEventList()
        getSpeakerEventList()
        getSportEventList()
        getFoodEventList()
        getReligiousEventList()
    }
    
}
