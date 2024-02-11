//
//  AdventureLogic.swift
//  MyAdventure
//
//  Created by Jasmine Sung on 11/2/2024.
//

import Foundation

struct AdventureLogic {
    let scenarios = [
        Scenario("You see a tortoise and a hare.",
                "Follow tortoise.", "Follow hare.", 1, 2),
        Scenario("The toroise needs help crossing the road because she is slow.",
                "Help her cross the road.", "Cross the road by yourself.", 3, 4),
        Scenario("The hare challenges you to a race.",
                "Race him.", "Don't race.", 5, 6),
        Scenario("The tortoise is touched and asks you to be friends.",
                "Be friends with her.", "Don't be friends.", -2, -1),
        Scenario("You see a million dollars on the road.",
                "Pick up all the money.", "Leave the money.", -2, -1),
        Scenario("The hare falls asleep under a tree.",
                "Keep running.", "Sit next to the hare.", -2, -1),
        Scenario("You see an apple on the ground",
                "Eat it.", "Don't eat it.", -2, -1),
    ]
    
    var currentIndex: Int = 0
    
    func isGameOver() -> Bool {
        return scenarios[currentIndex].next_index_one < 0 && scenarios[currentIndex].next_index_two < 0;
    }
    
    func isWin(_ option: Int) -> Bool {
        if option == 1 {
            return scenarios[currentIndex].next_index_one == -2
        } else {
            return scenarios[currentIndex].next_index_two == -2
        }
    }
    
    mutating func genNextScenario(_ option: Int) -> Scenario {
        if option == 1 {
            currentIndex = scenarios[currentIndex].next_index_one
        } else if option == 2 {
            currentIndex = scenarios[currentIndex].next_index_two
        } else if option == 0 {
            currentIndex = 0
        }
        return scenarios[currentIndex]
    }
}
