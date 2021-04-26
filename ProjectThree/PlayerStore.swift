//
//  PlayerStore.swift
//  ProjectThree
//
//  Created by Kirk S. Baguley on 11/11/20.
//  Copyright © 2020 Kirk S. Baguley. All rights reserved.
//

import UIKit

class PlayerStore {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchAllPlayers(completion: @escaping (Result<[Player], Error>) -> Void) {
        let url = URL(string: LakersAPI.baseURLString)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) {
            (data, response, error) in
            
            let result = self.processPlayersRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }
    
    private func processPlayersRequest(data: Data?, error: Error?) -> Result<[Player], Error> {
        guard let jsonData = data else {
            return .failure(error!)
        }
        return LakersAPI.players(fromJSON: jsonData)
    }
    
}
