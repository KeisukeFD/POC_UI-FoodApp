//
//  ContentView.swift
//  UI-FoodApp
//
//  Created by Valentin Malissen on 2020-07-16.
//

import SwiftUI

let foodList = [
    Food(imageName: "image_1", title: "Vegan salad bowl", subtitle: "With red tomato", price: 20, description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.", calories: "420Kcal"),
    Food(imageName: "image_2", title: "Vegan salad bowl", subtitle: "With red tomato", price: 24.99, description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.", calories: "400Kcal")
]


struct ContentView: View {
    @State var currentMenu = ""
    @State var searchQ = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Simple way to find\nTasty food")
                        .font(.custom("Poppins-Bold", size: 20))
                        .padding(.leading)
                        
                    Spacer()
                }.padding(.top, 25)
                .frame(height: 100)
                
                Menu(current: $currentMenu)
                
                SearchField(query: $searchQ)
                    .padding()
                    .padding(.bottom, -15)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: -15) {
                        ForEach(foodList, id: \.self.imageName) { food in
                            NavigationLink(
                                destination: DetailFood(food: food),
                                label: {
                                    FoodCard(food: food, height: 350)
                                }).buttonStyle(PlainButtonStyle())
                        }
                    }
                }.padding(.leading)
                
                HStack {
                    Spacer()
                    TextCircleButton(text: "+") {
                        print("Add button")
                    }
                }.padding(.trailing)
                .offset(y: -20)
                
                Spacer()
            }
            .navigationBarItems(trailing: Image("menu"))
            .navigationBarTitleDisplayMode(.inline)
        }.onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .white
            UINavigationBar.appearance().standardAppearance = appearance
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
