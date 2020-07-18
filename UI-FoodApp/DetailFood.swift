//
//  DetailFood.swift
//  UI-FoodApp
//
//  Created by Valentin Malissen on 2020-07-17.
//

import SwiftUI


struct DetailFood: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let food: Food

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color("backBtnColor"))
                    .opacity(1)
                    

                Image("\(food.imageName)_big")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.frame(height: 260)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("\(food.title)")
                        .font(.custom("Poppins-Bold", size: 18))

                    Spacer()
                    
                    Text("$ \(String(format: "%.2f", food.price))")
                        .font(.custom("Poppins-Bold", size: 22))
                        .bold()
                        .foregroundColor(Color("redAccentColor"))
                }
                
                Text("\(food.subtitle)")
                    .font(.custom("Poppins-Medium", size: 15))
                    .foregroundColor(Color("fadeGrayText"))
                
                Spacer().frame(height: 20)
                
                Text("\(food.description)")
                    .font(.custom("Poppins-Regular", size: 14))
                    .foregroundColor(Color("grayText"))
            }.padding()
            Spacer()
            
            HStack {
                Button(action: {}, label: {
                    HStack {
                        Text("Add to bag")
                            .font(.custom("Poppins-Bold", size: 14))
                            .foregroundColor(.black)
                        Spacer().frame(width: 60)
                        Image("forward")
                            .resizable()
                            .foregroundColor(.black)
                            .scaledToFit()
                            .frame(height: 12)
                    }.padding()
                    .padding(.top, 4)
                    .padding(.bottom, 4)
                    .background(Color("backBtnColor"))
                    .cornerRadius(20)
                })
                
                Spacer()
                
                ImageCircleButton(imageName: "bag", tag: 0) {
                    print("Cart button")
                }
            }.padding()
            

            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image("backward")
                .foregroundColor(.black)
        }, trailing: Image("menu"))
    }
}

struct DetailFood_Previews: PreviewProvider {
    static var previews: some View {
        DetailFood(food: foodList[0])
    }
}
