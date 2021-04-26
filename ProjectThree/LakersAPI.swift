//
//  LakersAPI.swift
//  ProjectThree
//
//  Created by Kirk S. Baguley on 11/11/20.
//  Copyright © 2020 Kirk S. Baguley. All rights reserved.
//

import Foundation

struct AppPlayersResponse: Codable {
    let players: [Player]
    
    enum CodingKeys: String, CodingKey {
        case players = "data"
    }
}

struct LakersAPI {
    static let baseURLString = "https://www.balldontlie.io/api/v1/players"
    
    static func players(fromJSON data: Data) -> Result<[Player], Error> {
        do {
            let decoder = JSONDecoder()
            let appResponse = try decoder.decode(AppPlayersResponse.self, from: data)
            let players = appResponse.players
            return .success(players)
        } catch {
            return .failure(error)
        }
    }

}
