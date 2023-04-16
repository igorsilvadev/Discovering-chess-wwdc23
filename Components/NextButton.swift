//
//  NextButton.swift
//  DiscoveringChess
//
//  Created by Igor Silva on 16/04/23.
//

import SwiftUI

struct NextButton: View {
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .fill(.white)
                    .cornerRadius(10)
                    .frame(width: 100, height: 60)
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
            }
 
        }
        .padding(80)
    }
}

struct NextButton_Previews: PreviewProvider {
    static var previews: some View {
        NextButton { }
    }
}
