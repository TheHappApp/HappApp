//
//  Event.swift
//  HappApp
//
//  Created by Turner White on 9/28/22.
//

import Foundation
import CoreLocation

enum EventCategory: String, Equatable, CaseIterable {
    case partyEvent = "partyEvent",
         concertEvent = "concertEvent",
         sportEvent = "sportEvent",
         companyEvent = "companyEvent",
         speakerEvent = "speakerEvent",
         foodEvent = "foodEvent",
         religiousEvent = "religiousEvent",
         clubEvent = "clubEvent",
         generalEvent = "generalEvent"
}

struct Event: Identifiable{
    var id: String {eventTitle}
    var eventTitle: String
    var eventDesc: String
    var eventHost: String
    var eventLocation: CLLocation
    var eventCategory: EventCategory
    var numAttending: Int
    var startTime: Date
    var endTime: Date
    var eventAddress: String
    
}
