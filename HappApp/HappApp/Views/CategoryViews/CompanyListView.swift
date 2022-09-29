//
//  CompanyListView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
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
