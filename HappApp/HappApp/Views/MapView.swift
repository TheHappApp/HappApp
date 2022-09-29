//
//  MapView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject private var vm = MapViewModel()
    @ObservedObject private var fireManager = firestoreManager()
    @State private var showEventSheet: Bool = false
    @State private var showingPopover: Bool = false
    
    @State var eventName: String = ""
    @State var eventAddress: String = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    
    var body: some View {
        
        ZStack {
            Map(coordinateRegion: $vm.region,
                showsUserLocation: true,
                annotationItems: fireManager.concertEventList+fireManager.generalEventList+fireManager.partyEventList+fireManager.companyEventList+fireManager.clubEventList+fireManager.speakerEventList+fireManager.sportEventList+fireManager.foodEventList+fireManager.religiousEventList,
                annotationContent: { event in
                
                MapAnnotation(coordinate: event.eventLocation.coordinate) {
                    NavigationLink {
                        EventInfoView(event: event,manager: fireManager)
                    } label: {
                        Image(systemName: "mappin.circle.fill")
                    }
                }
            }
            ).onAppear {
                if !vm.didCheckOnce {
                    vm.checkIfLocationServicesIsEnabled()
                }
            }.ignoresSafeArea()
            
            Button {
                showEventSheet.toggle()
            } label: {
                
                ZStack {
                    
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50, alignment: .bottomTrailing).opacity(0.75)
                    
                    Image(systemName: "plus")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                }
            }
            .frame(width: 350, height: 700, alignment: .bottomTrailing)
            .sheet(isPresented: $showEventSheet, onDismiss: didDismiss) {
                // Add code for sheet UI
                NewEventSheetView(showEventSheet: $showEventSheet, vm: vm,fireManager: fireManager)
            }.padding(.bottom, 10)
        }.ignoresSafeArea()
    }
    
    func didDismiss() {
        // Handle the dismissing action
    }
    
    //    enum Category: String, CaseIterable, Identifiable {
    //        case Sports
    //        case Concerts
    //        case Professional
    //
    //        var id: String { self.rawValue }
    //    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

