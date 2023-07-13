//
//  ContentView.swift
//  WarGame
//
//  Created by Amashi Silva on 2023-07-13.
//

import SwiftUI

struct ContentView: View {
    
    @State var amashiCard="card6"
    @State var dinithCard="card10"
    
    @State var amashiScore=0
    @State var dinithScore=0
    @State var round = 0
    
   @State var winner = ""
    
    @State var winStatus = false
    
    @State private var isShowingPopup = false

    
   
    
    
    var body: some View {
      
        ZStack{
            Image("background-wood-cartoon")
            VStack{
                
              Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200,height: 200)
                    .padding(.top,5)
                HStack{
                    Spacer()
                    Image(amashiCard)
                    Spacer()
                    Image(dinithCard)
                    Spacer()
                }
                
                VStack{
                    Button {
                        if (round == 10){
                            
                            if (amashiScore>dinithScore){
                               winStatus = true
                                isShowingPopup = true

                                        
                                        
                            }
                            
                            else if(amashiScore<dinithScore){
                                winStatus = false
                                isShowingPopup = true

                                       
                                        
                            }
                            else if(amashiScore==dinithScore && amashiScore >= 4){
                                winStatus = false
                                isShowingPopup = true

                                       
                                        
                            }
                            
                            print ("winner is" ,winner)
                        }
                        else{
                            deal()
                            round += 1
                        }

                        
                    } label: {
                        Image("deal")
                              .resizable()
                              .scaledToFit()
                              .frame(width: 200,height: 200)

                    }
                    .sheet(isPresented: $isShowingPopup) {
                        PopupView(isPresented: $isShowingPopup,amashiScore: $amashiScore , dinithScore: $dinithScore,round: $round, winStatus: $winStatus)
                            .presentationDetents([.height(500)])
                            .presentationCornerRadius(30)
                    }

                }
               
                
                
                VStack{
                    HStack{
                        Spacer()
                        VStack{
                            Text("Amashi")
                                .fontWeight(.bold)
                            
                            Text(String(amashiScore))
                                .padding(.top)
                        }
                        Spacer()
                        VStack{
                            Text("Dinith")
                                .fontWeight(.bold)
                            Text(String(dinithScore))
                                .padding(.top)
                        }
                        Spacer()
                        
                    }
                    .padding(.top,25)
                    .font(.system(size:20))
                    
                }
              
            }
           
           
          
        }
        .blur(radius: isShowingPopup ? 20:0)
        
    }
    
    func deal(){
        //get the player count
        
       var  amashiValue = String(Int.random(in: 2...14))
        amashiCard="card"+amashiValue
        
        //get the cpu count
       var  dinithValue=String(Int.random(in: 2...14))
        dinithCard="card"+dinithValue
        
        //compare score
        if (amashiValue>dinithValue){
            amashiScore += 1
        }
        else if(amashiValue<dinithValue){
            dinithScore += 1
        }
        
       
            
        }
 

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PopupView: View {
    @Binding var isPresented : Bool
    @Binding var amashiScore : Int
    @Binding var dinithScore: Int
    @Binding var round : Int
    @Binding var winStatus : Bool
    
        var body: some View {
            NavigationView {

            VStack {
                if (winStatus == true){
                    Image("won-removebg-preview")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300,height: 200)
                }else {
                    Image("over-removebg-preview")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300,height: 200)
                }
                    
                Button("Close") {
                    dismissPage()
                }
                .padding()
            }
            .frame(maxWidth: .infinity,maxHeight:.infinity)
            .background(Color.white)
            
        }
            
    }
    func dismissPage() {
        
        isPresented = false
        amashiScore = 0
        dinithScore = 0
        round = 0
       winStatus = false
        
       }
    
}
