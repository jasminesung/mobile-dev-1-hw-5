//
//  Scenario.swift
//  MyAdventure
//
//  Created by Jasmine Sung on 11/2/2024.
//

import Foundation

struct Scenario {
    init(_ desc: String, _ o_one:String, _ o_two: String, _ next_idx_one: Int, _ next_idx_two: Int) {
        description = desc
        option_one = o_one
        option_two = o_two
        next_index_one = next_idx_one
        next_index_two = next_idx_two
        
    }
    
    var description: String
    var next_index_one: Int
    var next_index_two: Int
    var option_one: String
    var option_two: String
}
