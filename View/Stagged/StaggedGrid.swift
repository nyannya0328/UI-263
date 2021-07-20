//
//  StaggedGrid.swift
//  UI-263
//
//  Created by nyannyan0328 on 2021/07/20.
//

import SwiftUI

struct StaggedGrid<Content : View,T : Identifiable>: View where T : Hashable {
    
    var content : (T) -> Content
    var list : [T]
    var showIndicator : Bool
    var columns : Int
    var spacing: CGFloat
    
    
    init(spacing : CGFloat = 10,columns : Int,showIndicator : Bool = false,list : [T],@ViewBuilder content : @escaping(T) ->Content){
        
        
        self.spacing = spacing
        self.columns = columns
        self.showIndicator = showIndicator
        self.list = list
        self.content = content
        
        
    }
    
    func setUP()->[[T]]{
        
        var girdArray : [[T]] = Array(repeating: [], count: columns)
        
        var currentIndex : Int = 0
        
        
        for object in list{
            
            girdArray[currentIndex].append(object)
            
            
            
            if currentIndex == (columns - 1){currentIndex = 0}
            
            else{
                
                currentIndex += 1
            }
            
            
            
        }
    
        return girdArray
        
    }
    
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            HStack(alignment:.top){
                
                ForEach(setUP(),id:\.self){columsData in
                    LazyVStack(spacing:spacing){
                        
                        
                        ForEach(columsData){object in
                            
                            content(object)
                            
                            
                        }
                    }
                    
                    
                }
            }
            .padding(.vertical)
        }
    }
}

struct StaggedGrid_Previews: PreviewProvider {
    static var previews: some View {
        StaggMain()
    }
}
