//
//  EventListView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
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
