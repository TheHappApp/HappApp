//
//  CompanyListView.swift
//  fp22-happ
//
//  Created by Turner White on 4/23/22.
//

import SwiftUI

struct CompanyListView: View {
    var vm: SearchViewModel
    
    var body: some View {
        List {
            ForEach(vm.companyEventList) { event in
                ListItemView(event:event)
            }
        }
    }
}

struct CompanyListView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyListView(vm:SearchViewModel())
    }
}
