//
//  UserCalendarViewController.swift
//  Locus
//
//  Created by Ludimila da Bela Cruz on 06/05/18.
//  Copyright © 2018 Locus. All rights reserved.
//

import UIKit

class UserCalendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    let daysOfWeek = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    //table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userInToggle", for: indexPath) as! UserInToggleTableViewCell
        cell.frinedName.text = "Joana"
        return cell
    
    }
    
    //collection
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "userCollection", for: indexPath) as! UserCalendarCollectionViewCell
        cell.friendImage.image = #imageLiteral(resourceName: "person")
        cell.dayOfWeek.text = daysOfWeek[indexPath.row]
        return cell
    }

}
