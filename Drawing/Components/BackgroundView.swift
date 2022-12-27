//
//  BackgroundView.swift
//  Drawing
//
//  Created by Илья Дубенский on 26.12.2022.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("HomeBarWallpaper")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .background(Color.black)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
            .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
