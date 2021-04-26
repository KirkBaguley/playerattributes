//
//  ViewController.swift
//  ProjectThree
//
//  Created by Kirk S. Baguley on 11/11/20.
//  Copyright © 2020 Kirk S. Baguley. All rights reserved.
//

import UIKit

class LakersViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet var collectionView: UICollectionView!
    var store: PlayerStore!
    let playerDataSource = PlayerDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = playerDataSource
        collectionView.delegate = self
          
        store.fetchAllPlayers {
            (playersResult) in

            switch playersResult {
            case let .success(players):
                print("Successfully found \(players.count) players.")
                self.playerDataSource.players = players
            case let .failure(error):
                print("Error fetching players: \(error)")
                self.playerDataSource.players.removeAll()
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    private func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerCollectionViewCell", for: indexPath) as! PlayerCollectionViewCell
        
        let player = playerDataSource.players[indexPath.row]
        
        cell.fnameLabel.text = player.fname
        cell.lnameLabel.text = player.lname
        cell.positionLabel.text = player.position
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        switch segue.identifier {
        case "showPlayer":
            if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
                let player = playerDataSource.players[selectedIndexPath.row]
                let destinationVC = segue.destination as! PlayerInfoViewController
                destinationVC.player = player
                destinationVC.store = store
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
}

