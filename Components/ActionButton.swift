//
//  ActionButton.swift
//  
//
//  Created by Igor Silva on 16/04/23.
//

import SwiftUI

struct ActionButton: View {
    let image: String
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Image(image)
        }
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(image: "") {
        
        }
    }
}
