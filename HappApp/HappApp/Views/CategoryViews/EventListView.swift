//
//  EventListView.swift
//  fp22-happ
//
//  Created by Turner White on 4/23/22.
//

import SwiftUI

struct EventListView: View {
    var vm: SearchViewModel
    
    var body: some View {
        List {
            ForEach(vm.generalEventList) { event in
                ListItemView(event:event)
            }
        }.onAppear {
            vm.getGeneralEventList()
        }
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView(vm:SearchViewModel())
    }
}
