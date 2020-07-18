//
//  FoodCard.swift
//  UI-FoodApp
//
//  Created by Valentin Malissen on 2020-07-17.
//

import SwiftUI


public struct Food {
    let imageName: String
    let title: String
    let subtitle: String
    let price: Double
    let description: String
    let calories: String
}


struct FoodCard: View {
    let food: Food
    var width: CGFloat
    var height: CGFloat
    
    init(food: Food, width: CGFloat = 275, height: CGFloat = 400) {
        self.food = food
        self.width = width
        self.height = height
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("backColorCard"))
                .frame(width: self.width, height: self.height)
                .cornerRadius(self.height / 8)
            
            Image("\(food.imageName)")
                .resizable()
                .frame(width: self.width, height: self.width * (2/3))
                .overlay(Circle().opacity(0.1).offset(x: 10, y: 10))
                .offset(x: self.width / -3.9, y: self.height / -2.8)
                
        
            VStack(alignment: .leading) {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("$ \(String(format: "%.2f", food.price))")
                            .font(.custom("Poppins-Bold", size: 22))
                            .bold()
                            .foregroundColor(Color("redAccentColor"))
                    }.padding(.trailing)
                    Spacer()
                }.frame(height: self.height / 2.2)

                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(food.title)")
                                .font(.custom("Poppins-Bold", size: 18))
                            
                            Text("\(food.subtitle)")
                                .font(.custom("Poppins-Medium", size: 15))
                                .foregroundColor(Color("fadeGrayText"))
                        }
                    }
                    Spacer().frame(height: 20)
                    
                    Text("\(food.description)")
                        .font(.custom("Poppins-Regular", size: 14))
                        .foregroundColor(Color("grayText"))
                        .frame(maxHeight: self.height / 7)
                        .lineLimit(2)
                        .lineSpacing(4)
                        .truncationMode(.tail)
                    
                    Spacer().frame(height: 20)
                    
                    Text("\(food.calories)")
                        .foregroundColor(Color("grayText"))
                        .font(.custom("Poppins-Medium", size: 14))

                    Spacer()
                }.padding()
            }.frame(maxWidth: self.width, maxHeight: self.height)
            
        }.frame(width: self.width + ((self.width * (2/3) / 3)), height: self.height + (self.width * (2/3)) / 2)
        
    }
}


struct FoodCard_Previews: PreviewProvider {
    static var previews: some View {
        FoodCard(food: Food(imageName: "image_1", title: "Vegan salad bowl", subtitle: "With red tomato", price: 20, description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.", calories: "420Kcal"))
    }
}
