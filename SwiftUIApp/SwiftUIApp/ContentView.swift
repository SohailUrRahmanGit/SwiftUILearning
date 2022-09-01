//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by sohail ur rahman on 01/09/22.
//

import SwiftUI

extension Image {

    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .opacity(0.5)
            .foregroundColor(.purple)
            .frame(maxWidth: 128)
            
    }
    

}

private let imageURL = "https://credo.academy/credo-academy@3x.png"

struct ContentView: View {
    var body: some View {
        
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.25))) { phase in

            switch phase {
            case .success(let image) :
                image.imageModifier()
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
              ProgressView()
            }
            
        }
        .padding(40)
        

}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
