//
//  ContentView.swift
//  HW3.4 sliderGame int UIKit
//
//  Created by Dmitry Tokarev on 21.12.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var randomValue = Int.random(in: 0...100)
    @State private var sliderValue = 50.0
    @State private var showAlert = false
    
    
    var body: some View {
        let result = Double(computeScore())
        VStack {
            
            Text("Подвинь слайдер, как можно ближе к: \(randomValue) !")
            
            HStack {
                Text("0")
                ColorSliderUIKit(sliderValue: $sliderValue,
                                 alphaValue: result / 100)
                    .shadow(radius: 5)
                Text("100")
            }
            
            VStack {
                Button(action: { showAlert = true } ) {
                    Text("Показать результат")
                }
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Твой результат:"),
                          message: Text("\(lround(result))"))
                })
                
                Button(action: { randomValue = Int.random(in: 0...100) } ) {
                    Text("Начать заново")
                }
                .offset(x: 0, y: 20)
            }.padding()
            
        }.padding()
    }
}

extension ContentView {
    private func computeScore() -> Int {
        let difference = abs(randomValue - lround(sliderValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
