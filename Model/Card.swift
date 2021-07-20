//
//  Card.swift
//  UI-263
//
//  Created by nyannyan0328 on 2021/07/20.
//

import SwiftUI

struct Card: Identifiable,Equatable {
    var id = UUID().uuidString
    var title : String
    var image : String
    var cardColor : String
}
var cards = [

Card(title: "Orangejuice just come out of my nose", image: "p1", cardColor: "C2"),
Card(title: "I lost your phone number", image: "p6", cardColor: "C1")


]
