//
//  PlayerDataSource.swift
//  ProjectThree
//
//  Created by Kirk S. Baguley on 11/18/20.
//  Copyright © 2020 Kirk S. Baguley. All rights reserved.
//

import UIKit

class PlayerDataSource: NSObject, UICollectionViewDataSource {
    
    var players = [Player]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifer = "PlayerCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifer, for: indexPath) as! PlayerCollectionViewCell
        
        let player = players[indexPath.row]
        
        cell.fnameLabel.text = player.fname
        cell.lnameLabel.text = player.lname
        cell.positionLabel.text = player.position
        
        return cell
    }
}
