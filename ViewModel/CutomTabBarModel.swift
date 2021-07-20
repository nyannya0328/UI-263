//
//  CutomTabBarModel.swift
//  UI-263
//
//  Created by nyannyan0328 on 2021/07/20.
//

import SwiftUI

class CutomTabBarModel: ObservableObject {
   
    
    @Published var currentTab = "Home"
    
    @Published var showDetail = false
    
    @Published var currentCard : Card?
    
}

