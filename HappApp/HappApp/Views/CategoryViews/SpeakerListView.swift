//
//  SpeakerListView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
//

import SwiftUI

struct SpeakerListView: View {
    var vm: SearchViewModel
    
    var body: some View {
        List {
            ForEach(vm.speakerEventList) { event in
                ListItemView(event:event)
            }
        }.onAppear {
            vm.getSpeakerEventList()
        }
    }
}

struct SpeakerListView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerListView(vm:SearchViewModel())
    }
}

