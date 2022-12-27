//
//  ContentView.swift
//  Drawing
//
//  Created by Илья Дубенский on 26.12.2022.
//

import SwiftUI

struct ContentView: View {

    @State private var addColorInShaker = true
    @State private var shake = false
    @State private var clearGlass = true

    @State private var redSlider = Double.random(in: 0...1)
    @State private var greenSlider = Double.random(in: 0...1)
    @State private var blueSlider = Double.random(in: 0...1)

    @State private var addedColors = [Color]()

    var body: some View {
        ZStack {
            BackgroundView()

            VStack {
                Text("1. Choose colors and add in the shaker")
                    .foregroundColor(.white)
                HStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .background(Color.clear)
                            .foregroundColor(Color.clear)
                        RectangleView(
                            redColor: redSlider,
                            greenColor: greenSlider,
                            blueColor: blueSlider
                        )
                        .frame(width: addColorInShaker ? 100 : 10,
                               height: addColorInShaker ? 100 : 10)
                        .offset(
                            x: addColorInShaker ? 0 : UIScreen.main.bounds.width - 230,
                            y: addColorInShaker ? 0 : UIScreen.main.bounds.height - 570
                        )
                        .animation(
                            Animation.easeIn(duration: 0.6).repeatCount(0, autoreverses: true),
                            value: addColorInShaker)
                    }
                    VStack {
                        SliderView(value: $redSlider, color: .red)
                        SliderView(value: $greenSlider, color: .green)
                        SliderView(value: $blueSlider, color: .blue)
                    }
                }
                .padding()

                Button("Add color in Shaker") {
                    addColor()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        addColorInShaker = true
                    }
                }
                .foregroundColor(.white)
                .frame(width: 250, height: 50)
                .background(Color.orange)
                .cornerRadius(12)

                Spacer()
                Text("2. Shake it")
                    .foregroundColor(.white)
                HStack {

                    VStack {
                        GlassView(
                            colors: !shake ? [.white.opacity(0.1)] : addedColors,
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(width: 130, height: 130)
                        .padding(.top, 160)
                        .offset(x: shake ? 0  : UIScreen.main.bounds.width - 600)
                        .animation(
                            Animation.easeOut(duration: 2).repeatCount(0, autoreverses: false),
                            value: shake
                        )

                        .offset(x: clearGlass ? 0  : UIScreen.main.bounds.width - 200)
                        .rotationEffect(.degrees(clearGlass ? 0 : 180))
                        .animation(
                            Animation.easeOut(duration: 0.7).repeatCount(0, autoreverses: true),
                            value: clearGlass
                        )
                    }

                    VStack {
                        ShakerCapView()
                            .frame(width: 140, height: 140)
                            .padding(.bottom, -120)
                            .rotationEffect(.degrees(shake ? 30 : 0))
                        ShakerView(colors: [.gray])
                            .frame(width: 140, height: 140)
                            .padding(.bottom, 80)
                    }
                    .padding(.trailing, 40)
                    .offset(y: shake ? 50 : 0)
                    .rotationEffect(.degrees(shake ? -45 : 0))
                    .animation(Animation.easeInOut(duration: 0.1).repeatCount(10, autoreverses: true), value: shake)
//                    Spacer()
                }

                Button("Shake") {
                    print(addedColors)
                    shakeColors()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        shake = false
                    }
                }
                .foregroundColor(.white)
                .frame(width: 250, height: 50)
                .background(Color.orange)
                .cornerRadius(12)
                Text("3. Clear it and repeat")
                    .foregroundColor(.white)
                Button("Clear") {
                    clearGlass.toggle()
                    addedColors.removeAll()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        clearGlass = true
                    }
                }
                .foregroundColor(.white)
                .frame(width: 250, height: 50)
                .background(Color.orange)
                .cornerRadius(12)
            }
            .padding()
        }
    }

    private func addColor() {
        addedColors.append(Color(red: redSlider,
                                green: greenSlider,
                                blue: blueSlider))
        redSlider = Double.random(in: 0...1)
        greenSlider = Double.random(in: 0...1)
        blueSlider = Double.random(in: 0...1)
        addColorInShaker.toggle()
    }

    private func shakeColors() {
        shake.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
