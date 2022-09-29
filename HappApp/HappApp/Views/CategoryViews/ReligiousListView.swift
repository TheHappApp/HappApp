//
//  ReligiousListView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
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
