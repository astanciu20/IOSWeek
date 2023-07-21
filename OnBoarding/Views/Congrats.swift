//
//  Congrats.swift
//  OnBoarding
//
//  Created by Andrei Stanciu on 20.07.2023.
//

import SwiftUI

struct Congrats: View {
    var body: some View {
        VStack(spacing: 30) {
            Image("checkmark")
            Text("Congratulations!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 30)
            VStack {
                Text("Welcome to IdeaBank!")
                Text("We're glad you are with us")
            }
            Spacer()
            VStack {
                ConfirmationButton(text: "Add money", isConfirmationEnabled: true, action: {})
                Button(action: {},
                 label: {
                    Text("Go to the Dashboard")
                        .frame(maxWidth: .infinity)
                        .bold()
                        .font(.title2)
                        .padding(10)
                        .foregroundColor(.black)
                })
                .background(RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(red: 0.4, green: 0.85, blue: 0.85), lineWidth: 2))
                .padding(.horizontal, 15))
            }
        }
        .padding(.init(top: 90, leading: 15, bottom: 15, trailing: 15))
        .navigationBarBackButtonHidden()
    }
}

struct Congrats_Previews: PreviewProvider {
    static var previews: some View {
        Congrats()
    }
}
