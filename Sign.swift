//
//  Sign.swift
//  RPS
//
//  Created by einar on 27/04/2017.
//  Copyright © 2017 einar. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissor
    }
}

enum Sign {
  case rock, paper, scissor
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissor:
            return "✌️"
        }
    }
    
    func play(_ opponent: Sign) -> GameState {
        switch self {
        case .rock:
            switch opponent {
            case .rock:
                return GameState.draw
            case .scissor:
                return GameState.win
            case .paper:
                return GameState.loose
            }
        case .scissor:
            switch opponent {
            case .rock:
                return GameState.loose
            case .scissor:
                return GameState.draw
            case .paper:
                return GameState.win
            }
        case .paper:
            switch opponent {
            case .rock:
                return GameState.win
            case .scissor:
                return GameState.loose
            case .paper:
                return GameState.draw
            }
        }
        
    }

}

