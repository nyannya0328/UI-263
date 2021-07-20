//
//  StaggMain.swift
//  UI-263
//
//  Created by nyannyan0328 on 2021/07/20.
//

import SwiftUI

struct StaggMain: View {
    
    @State var posts : [Post] = []
    
    @State var columns : Int = 2
    
    @Namespace var animation
    
    init(){
        
        
        UINavigationBar.appearance().barTintColor = .red
       
    }
    var body: some View {
        NavigationView{
            
            
            StaggedGrid(columns: columns, list: posts) { post in
                
                postCARDVIEW(post: post)
                    .matchedGeometryEffect(id: post.id, in: animation)
                   
                   
                
            }
            .padding(.horizontal)
            .navigationTitle("Stagg Main")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    
                    Button {
                        columns += 1
                        
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                    }

                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    
                    Button {
                        columns = max(columns-1, 1)
                        
                    } label: {
                        Image(systemName: "minus")
                            .font(.title)
                    }

                }
            }
            .animation(.easeIn, value: columns)
            
            
            
            
            
            
        }
        .padding(.bottom,70)
        .onAppear {
            for index in 1...10{
                
                posts.append(Post(imageURL: "p\(index)"))
                
            }
        }
    }
}

struct StaggMain_Previews: PreviewProvider {
    static var previews: some View {
        StaggMain()
    }
}

struct postCARDVIEW : View{
    
    var post : Post
    
    var body: some View{
        
        
        Image(post.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(20)
    }
}


