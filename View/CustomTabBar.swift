//
//  CustomTabBar.swift
//  UI-263
//
//  Created by nyannyan0328 on 2021/07/20.
//

import SwiftUI

struct CustomTabBar: View {
    
    @StateObject var model = CutomTabBarModel()
    @Namespace var animation
    
    init(){
        
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection:$model.currentTab){
            
            
          Home(animation: animation)
                .environmentObject(model)
                .tag("Home")
            
           ScrollTabBar()
                .tag("Purchased")
            
           StaggMain()
                .tag("Settings")
            
        }
        .overlay(
            HStack{
            
            TabButton(title: "Home", image: "house", animation: animation)
            
            TabButton(title: "Purchased", image: "purchased.circle", animation: animation)
            
            TabButton(title: "Settings", image: "gear.circle", animation: animation)
            
            
            
        }
                .environmentObject(model)
                .padding(.vertical,8)
                .padding(.horizontal)
                .background(.ultraThinMaterial,in: Capsule())
                .padding(.vertical,10)
                .padding(.horizontal,20)
                .padding(.bottom,5)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                .colorScheme(.light)
                .offset(y: model.showDetail ? 250 : 0)
            ,alignment: .bottom
        
        )
        
        .overlay(
        
        DetailView(animation: animation)
            .environmentObject(model)
        
        )
      
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabButton : View{
    var title : String
    var image : String
    @EnvironmentObject var model : CutomTabBarModel
    
    var animation : Namespace.ID
    
    var body: some View{
        
        
        Button {
            withAnimation{
                
                
                model.currentTab = title
            }
        } label: {
            
            VStack{
                
                Image(systemName: image)
                    .font(.title2)
                    .frame(height: 18)
                
                
                Text(title)
                    .font(.footnote.bold())
            }
            .foregroundColor(model.currentTab == title ? Color("Tab") : .gray)
            .frame(maxWidth: .infinity)
            .overlay(
            
                ZStack{
                
                
                if model.currentTab == title{
                    
                    
                    
                    CustomShape()
                        .fill(
                        
                        LinearGradient(colors: [
                        
                            Color("Tab").opacity(0.3),
                            .red.opacity(0.2),
                            .clear
                            
                            
                        
                        
                        ], startPoint: .top, endPoint: .bottom)
                        
                        )
                        .matchedGeometryEffect(id: "TAB", in: animation)
                        .padding(.top,-8)
                        .padding(.horizontal,8)
                    
                }
            }
            
            )
            
            
        }

    }
}


struct CustomShape : Shape{
    
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width - 10, y: rect.height))
            path.addLine(to: CGPoint(x: 10, y: rect.height))
        }
    }
}
