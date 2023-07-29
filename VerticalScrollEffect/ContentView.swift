//
//  ContentView.swift
//  Aarti
//
//  Created by Ashish Pisey on 28/07/23.
//

import SwiftUI

struct ContentView: View {
    
   var texts: [String] = ["", "", "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "", "", ""]
    
    func getPercentageDistFromCentre (geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.height / 2
        let currenty = geo.frame(in: .global).midY
        return Double(1 - abs(currenty - maxDistance)/maxDistance)
    }
    
    func getFontSize(geometry: GeometryProxy) -> CGFloat {
        let fontsize = (getPercentageDistFromCentre(geo: geometry) * 40)
        print(fontsize)
        return fontsize
    }
           
   var body: some View {
       ScrollView(.vertical) {
           VStack {
               ForEach(texts, id: \.self) { text in
                   GeometryReader { geo in
                       Text(text)
                           .frame(maxWidth: .infinity, alignment: .center)
                           .font(.system(size:getFontSize(geometry: geo))
                           )
                           .opacity( getPercentageDistFromCentre(geo: geo))
                           
                   }
                   .multilineTextAlignment(.center)
                   .padding(.vertical, 80)
               }
           }
       }
       .scrollIndicators(ScrollIndicatorVisibility.hidden)
       .scrollPosition(initialAnchor: .top)
       .foregroundStyle(.primary)
   }
}

#Preview {
    ContentView()
}
