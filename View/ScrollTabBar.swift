//
//  ScrollTabBar.swift
//  UI-263
//
//  Created by nyannyan0328 on 2021/07/18.
//

import SwiftUI

struct ScrollTabBar: View {
    @State var selected = 1
    var body: some View {
     
            
            
        TabView(selection:$selected){
            
            
            ForEach(1...6,id:\.self){index in
                
                
                GeometryReader{proxy in
                    
                    let minX = proxy.frame(in:.global).minX
                   
                    let size = proxy.size
                    
              
                        
                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                           
                            
                            .frame(width: size.width, height: size.height)
                            .offset(x: -minX)
                    
                          
                            
                            
                   
                }
               .frame(height: UIScreen.main.bounds.height / 2)
               
              
                .cornerRadius(15)
                .padding(10)
                .background(.white)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.3), radius: -5, x: -5, y: -5)
                .cornerRadius(15)
                .overlay(
                
                Image("p\(selected)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .shadow(color: .red, radius: 5, x: 5, y: 5)
                    .shadow(color: .green, radius: 5, x: -5, y: -5)
                  
               
                
                ,alignment: .bottomTrailing
                
                )
                
               
                
                
            }
            
            
            
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
       
       
      
                
             
                
             
    }
}

struct ScrollTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ScrollTabBar()
    }
}
