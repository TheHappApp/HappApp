//
//  FoodListView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
//

import SwiftUI

struct FoodListView: View {
    var vm: SearchViewModel
    
    var body: some View {
        List {
            ForEach(vm.foodEventList) { event in
                ListItemView(event:event)
            }
        }.onAppear {
            vm.getFoodEventList()
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView(vm:SearchViewModel())
    }
}
