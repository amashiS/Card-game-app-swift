//
//  ContentView.swift
//  WarGame
//
//  Created by Amashi Silva on 2023-07-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("background-wood-cartoon")
            VStack{
                
              Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200,height: 200)
              
            }
           
           
          
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
