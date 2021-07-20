//
//  Home.swift
//  UI-263
//
//  Created by nyannyan0328 on 2021/07/20.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var model : CutomTabBarModel
    var animation : Namespace.ID
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing:20){
                
                Text("Best Selling")
                    .font(.largeTitle.bold())
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                
                ForEach(cards){card in
                    
                    
                    Button {
                        withAnimation(.spring()){
                            
                         model.currentCard = card
                     model.showDetail = true
                            
                            
                        }
                    } label: {
                        VStack(spacing:20){
                          cardView(card: card)
                            
                            
                            
                            
                            
                            
                            
                            
                        }
                        .padding()
                        .background(
                            
                            getBG(card: card)
                        
                        
                        )
                        .foregroundColor(.white)
                        
                    }
                    .buttonStyle(CardButtonStyle())

                    
                    
                }
                
                
                
            }
            .padding()
            .padding(.bottom,80)
            
            
        }
    }
    @ViewBuilder
    
    func getBG(card : Card) -> some View{
        
        ZStack{
            
            
            if model.showDetail && model.currentCard == card{
                
                
                    LinearGradient(colors: [
                    
                        Color("\(card.cardColor)1"),
                        Color("\(card.cardColor)2"),
                        Color("\(card.cardColor)3"),
                    
                    
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                      
                    
                        .cornerRadius(10)
                
                
            }
            
            else{
                
                
                    LinearGradient(colors: [
                    
                        Color("\(card.cardColor)1"),
                        Color("\(card.cardColor)2"),
                        Color("\(card.cardColor)3"),
                    
                    
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .matchedGeometryEffect(id: card.id + "BG", in: animation)
                    
                        .cornerRadius(10)
                
                
                
            }
            
        }
        
        
    }
    
    
    @ViewBuilder
    
    func cardView(card : Card)->some View{
        
        VStack{
            
            
            if model.showDetail && model.currentCard == card{
                
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0)
                 
                
                
                Text(card.title)
                    .font(.caption)
                    .opacity(0)
                   
                  
                
                
            }
            
            else{
                
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                  .matchedGeometryEffect(id: card.id + "IMAGE", in: animation)
                
                
                Text(card.title)
                    .font(.caption)
                   
                    .matchedGeometryEffect(id: "\(card.id )+ TITLE", in: animation)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardButtonStyle : ButtonStyle{
    
    
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
        
            .scaleEffect(configuration.isPressed ? 0.7 : 1)
            .shadow(radius: configuration.isPressed ? 20 : 0)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}
