//
//  Menu.swift
//  UI-FoodApp
//
//  Created by Valentin Malissen on 2020-07-16.
//

import SwiftUI

enum MenuItems: String, CaseIterable {
    case All = "All"
    case Italian = "Italian"
    case Asian = "Asian"
    case Chinese = "Chinese"
    case French = "French"
    case Burgers = "Burgers"
}

struct Menu: View {
    @Binding var current: String
    @State var active: MenuItems = MenuItems.All
        
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(MenuItems.allCases, id: \.self) { item in
                    Button(action: {
                        self.active = item
                        self.current = item.rawValue
                    }) {
                        if(self.active == item) {
                            Text(item.rawValue)
                                .foregroundColor(Color("redAccentColor"))
                                .font(.custom("Poppins-Bold", size: 16))
                        } else {
                            Text(item.rawValue)
                                .foregroundColor(.gray)
                                .font(.custom("Poppins-Bold", size: 14))
                        }
                    }
                }
            }.padding(.leading)
        }
    }
}
//
//struct Menu_Previews: PreviewProvider {
//    static var previews: some View {
////        Menu(current: $currentMenu)
////        Menu(active: MenuItems.Asian)
//    }
//}
