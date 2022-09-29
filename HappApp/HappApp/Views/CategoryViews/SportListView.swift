//
//  SportListView.swift
//  fp22-happ
//
//  Created by Turner White on 4/23/22.
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
