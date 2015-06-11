//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



enum Colors {
    
    case Red
    case Green
    case Blue
    case Yellow
}

 var favoriteColor = Colors.Green


println(favoriteColor)

println(favoriteColor.hashValue)

 var yourFavorite = Colors.Red

if let yourFavorite = Colors.Red {
    
    favoriteColor = .Blue
    
}

println(favoriteColor.hashValue)


