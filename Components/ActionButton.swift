//
//  ActionButton.swift
//  
//
//  Created by Igor Silva on 16/04/23.
//

import SwiftUI

struct ActionButton: View {
    let title: String
    let titleFont: Font
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .multilineTextAlignment(.center)
                .font(titleFont)
                .padding()
                .background(
                    Rectangle()
                        .fill(.white)
                        .cornerRadius(30)
                    )
 
        }
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(title: "Next", titleFont: .title) {
            
        }
    }
}
