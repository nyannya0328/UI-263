//
//  DetailView.swift
//  UI-263
//
//  Created by nyannyan0328 on 2021/07/20.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var model : CutomTabBarModel
    var animation : Namespace.ID
    
    @State var showData = false
    var body: some View {
        if let card = model.currentCard,model.showDetail{
            
            
            VStack(spacing:0){
                
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: card.id + "IMAGE", in: animation)
                
                    .background(
                    
                        LinearGradient(colors: [
                        
                            Color("\(card.cardColor)1"),
                            Color("\(card.cardColor)2"),
                            Color("\(card.cardColor)3"),
                        
                        
                        ], startPoint: .topLeading, endPoint: .bottomTrailing)
                            .matchedGeometryEffect(id: card.id + "BG", in: animation)
                           
                            .cornerRadius(10)
                            .ignoresSafeArea()
                    
                    
                    )
                    .overlay(
                    
                        Button(action: {
                        withAnimation{
                            
                            model.showDetail.toggle()
                        }
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(.gray,in: Circle())
                            .shadow(radius: 10)
                    })
                            .padding(18)
                            .opacity(showData ? 1 : 0)
                        
                        ,alignment: .topTrailing
                            
                        
                    
                    )
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(card.title)
                            .font(.title2.bold())
                            .matchedGeometryEffect(id: "\(card.id )+ TITLE", in: animation)
                            .padding(.bottom)
                        
                        
                        
                        ForEach(1...30,id:\.self){index in
                            
                            HStack(spacing:10){
                                
                                
                                Image(systemName: "swift")
                                    .padding()
                                    .background(.cyan,in: RoundedRectangle(cornerRadius: 10))
                                
                                Text("DAY\(index)of Swift UI")
                                    .font(.title3.weight(.semibold))
                                
                                
                                Spacer()
                                
                                Image(systemName: "play.fill")
                                    .font(.title)
                                    .foregroundColor(Color("C12"))

                            }
                            .padding(.vertical,8)
                            .padding(.horizontal)
                            
                            .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 10))
                            
                        }
                        .opacity(showData ? 1 : 0)
                        
                        
                    }
                    .padding()
                    .padding(.top,8)
                
                  
                    
                    
                }
                    
                
                
                
                
            }
            .background(.ultraThinMaterial)
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.08) {
                    
                   showData = true
                    
                    
                }
                
            }
            .onDisappear {
                withAnimation{
                    
                    showData = false
                }
            }
            
            
            
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
