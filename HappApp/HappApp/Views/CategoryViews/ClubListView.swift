//
//  ClubListView.swift
//  fp22-happ
//
//  Created by Turner White on 4/23/22.
//

import SwiftUI

struct ClubListView: View {
    
    var vm: SearchViewModel
    
    var body: some View {
        List {
            ForEach(vm.clubEventList) { event in
                ListItemView(event:event)
            }
        }.onAppear {
            vm.getClubEventList()
        }
    }
}

struct ClubListView_Previews: PreviewProvider {
    static var previews: some View {
        ClubListView(vm: SearchViewModel())
    }
}
