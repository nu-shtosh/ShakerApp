//
//  ShakerCapView.swift
//  Drawing
//
//  Created by Илья Дубенский on 26.12.2022.
//

import SwiftUI

struct ShakerCapView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let middle = size / 2
            let farLine = size * 0.9
            let nearLine = size * 0.1

            Path { path in
                path.move(to: CGPoint(x: middle * 0.6, y: nearLine))
                path.addQuadCurve(to: CGPoint(x: middle * 0.8, y: middle * -0.3),
                                  control: CGPoint(x: nearLine * 2, y: nearLine * -1))
                path.addLine(to: CGPoint(x: middle * 1.2, y: middle * -0.3))
                path.addQuadCurve(to: CGPoint(x: middle * 1.4, y: nearLine),
                                  control: CGPoint(x: middle * 1.6, y: middle * -0.2))
            }
            .stroke(Color.white, lineWidth: 2)

            Path { path in
                path.move(to: CGPoint(x: middle * 0.6, y: nearLine))
                path.addQuadCurve(to: CGPoint(x: middle * 0.8, y: middle * -0.3),
                                  control: CGPoint(x: nearLine * 2, y: nearLine * -1))
                path.addLine(to: CGPoint(x: middle * 1.2, y: middle * -0.3))
                path.addQuadCurve(to: CGPoint(x: middle * 1.4, y: nearLine),
                                  control: CGPoint(x: middle * 1.6, y: middle * -0.2))
            }
            .fill(Color.gray)

            Path { path in
                path.move(to: CGPoint(x: farLine, y: nearLine * 3))
                path.addLine(to: CGPoint(x: nearLine, y: nearLine * 3))
                path.addQuadCurve(to: CGPoint(x: nearLine * 1.5, y: nearLine * 1),
                                  control: CGPoint(x: nearLine, y: nearLine))
                path.addLine(to: CGPoint(x: farLine * 0.95, y: nearLine))
                path.addQuadCurve(to: CGPoint(x: farLine, y: nearLine * 3),
                                  control: CGPoint(x: farLine, y: nearLine))
            }
            .stroke(Color.white, lineWidth: 2)

            Path { path in
                path.move(to: CGPoint(x: farLine, y: nearLine * 3))
                path.addLine(to: CGPoint(x: nearLine, y: nearLine * 3))
                path.addQuadCurve(to: CGPoint(x: nearLine * 1.5, y: nearLine * 1),
                                  control: CGPoint(x: nearLine, y: nearLine))
                path.addLine(to: CGPoint(x: farLine * 0.95, y: nearLine))
                path.addQuadCurve(to: CGPoint(x: farLine, y: nearLine * 3),
                                  control: CGPoint(x: farLine, y: nearLine))
            }
            .fill(Color.gray)
        }
    }
}

struct ShakerCapView_Previews: PreviewProvider {
    static var previews: some View {
        ShakerCapView()
            .frame(width: 170, height: 170)
    }
}
