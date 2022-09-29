//
//  FoodListView.swift
//  fp22-happ
//
//  Created by Turner White on 4/23/22.
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
