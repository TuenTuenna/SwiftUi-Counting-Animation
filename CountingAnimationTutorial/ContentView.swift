//
//  ContentView.swift
//  CountingAnimationTutorial
//
//  Created by Jeff Jeong on 2022/05/06.
//

import SwiftUI

struct ContentView: View {
    
    @State var number : Int = 0
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 8).fill(.black)
                .frame(maxWidth: 100, maxHeight: 150)
                .padding()
                .modifier(CountingNumberAnimationModifier(number: CGFloat(number)))
            
            Button(action: refresh, label: {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .black))
                    .padding()
                    .background(Circle().fill(.blue))
            })
            
        }
        .onAppear{
            withAnimation(.easeInOut(duration: 3).delay(1.5)){
                self.number = 100
            }
        }
    }
}

extension ContentView {
    fileprivate func refresh(){
        print("ContentView - refresh() called")
        self.number = 0
        withAnimation(.easeInOut(duration: 3).delay(1.5)){
            if self.number == 0 {
                self.number = 100
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
