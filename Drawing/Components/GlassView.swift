//
//  GlassView.swift
//  Drawing
//
//  Created by Илья Дубенский on 26.12.2022.
//

import SwiftUI

struct GlassView: View {
    let colors: [Color]
    let startPoint: UnitPoint
    let endPoint: UnitPoint

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let farLine = size * 0.9
            let nearLine = size * 0.1

            Path { path in
                path.move(to: CGPoint(x: farLine, y: nearLine))
                path.addLine(to: CGPoint(x: farLine * 0.93, y: farLine))
                path.addLine(to: CGPoint(x: nearLine * 1.63, y: farLine))
                path.addLine(to: CGPoint(x: nearLine, y: nearLine))
                path.addQuadCurve(
                    to: CGPoint(x: nearLine * 1.1, y: nearLine * 1.03),
                    control: CGPoint(x: nearLine * 1.05, y: nearLine * 0.9)
                )
                path.addLine(to: CGPoint(x: nearLine * 1.73, y: farLine * 0.99))
                path.addLine(to: CGPoint(x: farLine * 0.92, y: farLine * 0.99))
                path.addLine(to: CGPoint(x: farLine * 0.99, y: nearLine * 1.03))
                path.addQuadCurve(
                    to: CGPoint(x: farLine, y: nearLine),
                    control: CGPoint(x: farLine * 0.996, y: nearLine * 0.9)
                )
            }
            .stroke(Color.white, lineWidth: 0.5)

            Path { path in
                path.move(to: CGPoint(x: nearLine * 1.1, y: nearLine * 1.03))
                path.addLine(to: CGPoint(x: nearLine * 1.73, y: farLine * 0.99))
                path.addLine(to: CGPoint(x: farLine * 0.92, y: farLine * 0.99))
                path.addLine(to: CGPoint(x: farLine * 0.99, y: nearLine * 1.03))
                path.addLine(to: CGPoint(x: nearLine * 1.1, y: nearLine * 1.03))
                
            }
            .fill(LinearGradient(
                colors: colors,
                startPoint: startPoint,
                endPoint: endPoint)
            )
            .opacity(1)
        }
    }
}

struct GlassView_Previews: PreviewProvider {
    static var previews: some View {
        GlassView(colors: [.white], startPoint: .top, endPoint: .bottom)
            .frame(width: 300, height: 300)

    }
}
