//
//  ReligiousListView.swift
//  fp22-happ
//
//  Created by Turner White on 4/23/22.
//

import SwiftUI

struct ReligiousListView: View {
    var vm: SearchViewModel
    
    var body: some View {
        List {
            ForEach(vm.religiousEventList) { event in
                ListItemView(event:event)
            }
        }.onAppear {
            vm.getReligiousEventList()
        }
    }
}

struct ReligiousListView_Previews: PreviewProvider {
    static var previews: some View {
        ReligiousListView(vm:SearchViewModel())
    }
}
