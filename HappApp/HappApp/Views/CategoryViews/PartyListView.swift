//
//  PartyListView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
//

import SwiftUI

struct PartyListView: View {
    var vm: SearchViewModel
    
    var body: some View {
        List {
            ForEach(vm.partyEventList) { event in
                ListItemView(event:event)
            }
        }.onAppear {
            vm.getPartyEventList()
        }
    }
}

struct PartyListView_Previews: PreviewProvider {
    static var previews: some View {
        PartyListView(vm:SearchViewModel())
    }
}
