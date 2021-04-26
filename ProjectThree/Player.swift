//
//  Player.swift
//  ProjectThree
//
//  Created by Kirk S. Baguley on 11/16/20.
//  Copyright © 2020 Kirk S. Baguley. All rights reserved.
//

import Foundation

class Player: Codable {
    let fname: String
    let lname: String
    let position: String
    let heightft: Int?
    let heightin: Int?
    let weight: Int?

    enum CodingKeys: String, CodingKey {
        case fname = "first_name"
        case lname = "last_name"
        case position = "position"
        case heightft = "height_feet"
        case heightin = "height_inches"
        case weight = "weight_pounds"
    }
}
