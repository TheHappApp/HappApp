//
//  ConcertListView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
//

import SwiftUI

struct ConcertListView: View {
    
    var vm: SearchViewModel
    
    var body: some View {
        List {
            ForEach(vm.concertEventList) { event in
                ListItemView(event:event)
            }
        }.onAppear {
            vm.getConcertEventList()
        }
    }
}

struct ConcertListView_Previews: PreviewProvider {
    static var previews: some View {
        ConcertListView(vm:SearchViewModel())
    }
}
