//
//  GameState.swift
//  RPS
//
//  Created by einar on 27/04/2017.
//  Copyright © 2017 einar. All rights reserved.
//

import Foundation


enum GameState {
    case start, win, loose, draw
    
    var message: String {
        switch self {
            case .start:
                return "🤖"
            case .win:
                return "You Won!!"
            case .loose:
                return "You lost!!!"
            case .draw:
                return "Draw"
        }
    }
}
