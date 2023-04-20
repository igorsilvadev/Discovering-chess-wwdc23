//
//  MessageView.swift
//  DiscoveringChess
//
//  Created by Igor Silva on 16/04/23.
//

import SwiftUI

struct MessageView: View {
    @State var text: String = ""
    var finalText: String
    var fontSize: Font
    @State var scale = 0.5
    var body: some View {
            ZStack {
                Text(finalText)
                    .multilineTextAlignment(.center)
                    .font(fontSize)
                    .padding()
                    .background(
                        Rectangle()
                            .fill(.white)
                            .cornerRadius(30)
                        )
        }.scaleEffect(scale)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: 1)

                withAnimation(baseAnimation) {
                    scale = 1.0
                }
            }
        
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(finalText: "Simple Text", fontSize: .title)
    }
}
