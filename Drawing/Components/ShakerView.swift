//
//  ShakerView.swift
//  Drawing
//
//  Created by Илья Дубенский on 26.12.2022.
//

import SwiftUI

struct ShakerView: View {
    let colors: [Color]

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let farLine = size * 0.9
            let nearLine = size * 0.1

            Path { path in
                path.move(to: CGPoint(x: farLine, y: nearLine))
                path.addLine(to: CGPoint(x: farLine * 0.9, y: farLine * 1.55))
                path.addLine(to: CGPoint(x: nearLine * 1.9, y: farLine * 1.55))
                path.addLine(to: CGPoint(x: nearLine * 1, y: farLine * 0.11))
                path.addLine(to: CGPoint(x: farLine, y: nearLine))
                path.closeSubpath()
            }
            .stroke(Color.white, lineWidth: 2)

            Path { path in
                path.move(to: CGPoint(x: farLine, y: nearLine))
                path.addLine(to: CGPoint(x: farLine * 0.9, y: farLine * 1.55))
                path.addLine(to: CGPoint(x: nearLine * 1.9, y: farLine * 1.55))
                path.addLine(to: CGPoint(x: nearLine * 1, y: farLine * 0.11))
                path.addLine(to: CGPoint(x: farLine, y: nearLine))
                path.closeSubpath()
            }
            .fill(LinearGradient(colors: colors, startPoint: .top, endPoint: .bottom))

        }
    }
}

struct ShakerView_Previews: PreviewProvider {
    static var previews: some View {
        ShakerView(colors: [.gray])
            .frame(width: 200, height: 300)
    }
}
