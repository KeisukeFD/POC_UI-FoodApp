//
//  CircleButton.swift
//  UI-FoodApp
//
//  Created by Valentin Malissen on 2020-07-17.
//

import SwiftUI


struct ImageCircleButton: View {
    var imageName: String
    var tag: Int?
    
    var action: () -> ()
    
    var body: some View {
        CircleButton(image: imageName, tag: tag, action: action)
    }
}


struct TextCircleButton: View {
    var text: String
    var tag: Int?
    var action: () -> ()
    
    var body: some View {
        CircleButton(text: text, tag: tag, action: action)
    }
}


fileprivate struct CircleButton: View {
    var text: String?
    var image: String?
    var tag: Int?
    
    var action: () -> ()
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                Circle()
                    .frame(width: 60)
                    .foregroundColor(Color("redAccentColor"))
                    .overlay(Circle()
                                .frame(width: 75, height: 75)
                                .foregroundColor(Color("redAccentColor"))
                                .opacity(0.2)
                    )
                if(self.text != nil) {
                    Text("\(self.text!)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                } else if(self.image != nil) {
                    Image("\(self.image!)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .foregroundColor(.white)
                }
                
                if(tag != nil) {
                    ZStack {
                        Circle()
                            .frame(width: 25)
                            .foregroundColor(.white)
                        
                        Text("\(tag!)")
                            .font(.custom("Poppins-Bold", size: 14))
                            .foregroundColor(Color("redAccentColor"))
                    }.offset(x: 13, y: 13)
                }
            }.frame(width: 70, height: 70)
        })
    }
}

