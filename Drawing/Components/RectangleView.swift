//
//  RectangleView.swift
//  Drawing
//
//  Created by Илья Дубенский on 26.12.2022.
//

import SwiftUI

struct RectangleView: View {

    let redColor: Double
    let greenColor: Double
    let blueColor: Double

    var body: some View {
        Rectangle()
            .foregroundColor(Color(CGColor(red: redColor,
                                           green: greenColor,
                                           blue: blueColor,
                                           alpha: 1)))
            .overlay(
                RoundedRectangle(cornerRadius: 30).stroke(
                    Color.white, lineWidth: 5
                )
            )

            .cornerRadius(30)
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView(redColor: 1, greenColor: 1, blueColor: 0.5).background(Color.gray)
            .frame(width: 200, height: 200)
    }
}
