//
//  SearchField.swift
//  UI-FoodApp
//
//  Created by Valentin Malissen on 2020-07-16.
//

import SwiftUI

struct SearchField: View {
    @Binding var query: String

    var body: some View {
        HStack {
            Image("search")
                .resizable()
                .frame(width: 20, height: 20)
            
            TextField("", text: $query)
                .padding(.all, 5)
        }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.gray, lineWidth: 1))

    }
}
