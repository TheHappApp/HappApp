//
//  EventInfoView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
//

import SwiftUI
import MapKit

struct EventInfoView: View {
    
    var event: Event
    var manager: firestoreManager
    var eventTimeFormatter = DateFormatter()
    @State var didRSVP = false
    
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                
                
                
                HStack {
                    Text(event.eventTitle)
                        .font(.title)
                    HStack {
                        Image(systemName: "person.2")
                            .font(.title3)
                        
                        Text(String(event.numAttending))
                            .font(.title3)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
//                .padding()
                
                HStack {
                    
                    Image(systemName: "person")
                    
                    Text(event.eventHost)
                        .font(.title3)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                HStack {
                    
                    Image(systemName: "pin")
                    
                    Text(event.eventAddress)
                        .font(.title3)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                }
            
            VStack {

                HStack {
                    Image(systemName: "clock")
                    
                    Text(event.startTime.formatted(.dateTime))
                        .font(.title3)
            
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                HStack {
                    
                    Image(systemName: "text.bubble")
                    
                    Text(event.eventDesc)
                        .font(.title3)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                Button {
                    //
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 200)
                            .foregroundColor(.blue)
                        
                        Text("I'll Be There")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .cornerRadius(8)
    
                    }
                    .padding()
                }
                
                Button {
                    //
                } label: {
                    Text("Take Me Off The List")
                        .foregroundColor(.red)
                }


            }
        }
        .navigationBarTitle("")
        
        Spacer()
    }
}

struct EventInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EventInfoView(event: Event(eventTitle: "Quad Chilling", eventDesc: "working on happ in the big tent at the quad with some nice weather", eventHost: "Turner", eventLocation: CLLocation(latitude: 39, longitude: -70), eventCategory: EventCategory.clubEvent, numAttending: 0, startTime: Date(), endTime: Date(),
                                   eventAddress: "Bruh"),manager: firestoreManager())
    }
}

