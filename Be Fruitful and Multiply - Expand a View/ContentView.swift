//
//  ContentView.swift
//  Be Fruitful and Multiply - Expand a View
//
//  Created by Stephen DeStefano on 1/21/22.
//

import SwiftUI

struct ContentView: View {
    @State var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ZStack {
                ExpandingView(expand: $isAnimating, direction: .bottom, symbolName: "note.text")
                ExpandingView(expand: $isAnimating, direction: .left, symbolName: "doc")
                ExpandingView(expand: $isAnimating, direction: .top, symbolName: "photo")
                ExpandingView(expand: $isAnimating, direction: .right, symbolName: "mic.fill")
                
                Image(systemName: "plus").font(.system(size: 40, weight: isAnimating ? .regular : .semibold, design: .rounded))
                    .foregroundColor(isAnimating ? Color.white : Color.black)
                    .rotationEffect(isAnimating ? .degrees(45) : .degrees(0))
                    .scaleEffect(isAnimating ? 3 : 1)
                    .opacity(isAnimating ? 0.5 : 1)
                    .animation(Animation.spring(response: 0.35, dampingFraction: 0.85, blendDuration: 1), value: isAnimating)
                    .onTapGesture {
                        isAnimating .toggle()
                    }
            }
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
