//
//  SportListView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
//

import SwiftUI

struct SportListView: View {
    var vm: SearchViewModel
    
    var body: some View {
        List {
            ForEach(vm.sportEventList) { event in
                ListItemView(event:event)
            }
        }.onAppear {
            vm.getSportEventList()
        }
    }
}

struct SportListView_Previews: PreviewProvider {
    static var previews: some View {
        SportListView(vm:SearchViewModel())
    }
}
