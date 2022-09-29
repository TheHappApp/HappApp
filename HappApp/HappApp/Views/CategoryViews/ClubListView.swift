//
//  ClubListView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
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
