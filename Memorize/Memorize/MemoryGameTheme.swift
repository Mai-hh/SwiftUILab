//
//  MemoryGameTheme.swift
//  Memorize
//
//  Created by Maihao on 2022/1/28.
//

import Foundation

class MemoryGameTheme: ObservableObject {
    
    
    
}

enum Theme {
    case summer, winter
    
    func name() -> String {
        switch self {
        case .summer:
            return "summer"
        case .winter:
            return "winter"
        }
    }
    
    func emojis() -> [String] {
        switch self {
        case .summer:
            return ["π¨βπ©βπ§", "π¨βπ©βπ§βπ¦", "π¨βπ©βπ¦βπ¦", "π¨βπ©βπ§βπ§", "π©βπ©βπ¦", "π©βπ©βπ§", "π©βπ©βπ§βπ¦",
                    "π©βπ©βπ¦βπ¦", "π©βπ©βπ§βπ§", "π¨βπ¨βπ¦", "π¨βπ¨βπ§", "π¨βπ¨βπ§βπ¦", "π¨βπ¨βπ¦βπ¦", "π¨βπ¨βπ§βπ§",
                    "π©βπ¦", "π©βπ§", "π©βπ§βπ¦", "π©βπ¦βπ¦","π©βπ§βπ§", "π¨βπ¦"]
        case .winter:
            return ["π", "π", "π", "π", "π", "π", "π",
                    "π€£", "π₯²", "βΊοΈ", "π", "π", "π", "π",
                    "π", "π", "π", "π₯°", "π", "π"]
        }
    }
    
    func color() -> String {
        switch self {
        case .summer:
            return "orange"
        case .winter:
            return "blue"
        }
    }
    
    func firstShowPairsCount() -> Int {
        switch self {
        case .summer:
            return emojis().count
        case .winter:
            return emojis().count / 2
        }
    }
}
