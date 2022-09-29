//
//  ListItemView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
//

import SwiftUI
import MapKit

struct ListItemView: View {
    var event: Event
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("\(event.eventTitle)").font(.headline)
                    Spacer()
                    Text("Num Attending: \(event.numAttending)")
                }
                Text("\(event.eventDesc)").font(.body)
                
                Text("Location: \(event.eventAddress)").font(.subheadline)
            }
            
            Spacer()
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(event: Event(eventTitle: "Quad Chilling", eventDesc: "working on happ in the big tent at the quad with some nice weather", eventHost: "Turner", eventLocation: CLLocation(latitude: 39, longitude: -70), eventCategory: EventCategory.clubEvent, numAttending: 0, startTime: Date(), endTime: Date(),eventAddress: ""))
    }
}
