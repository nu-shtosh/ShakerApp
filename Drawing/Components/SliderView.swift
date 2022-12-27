//
//  SliderView.swift
//  Drawing
//
//  Created by Илья Дубенский on 26.12.2022.
//

import SwiftUI

struct SliderView: View {

    @Binding var value: Double

    let color: Color

    var body: some View {
        HStack {
            Slider(value: $value)
                .accentColor(color)
                .animation(.easeInOut, value: value)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(1.0), color: .white).background(Color.blue)
    }
}
