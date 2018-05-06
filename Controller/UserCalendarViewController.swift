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
    let personImage = [#imageLiteral(resourceName: "person"), #imageLiteral(resourceName: "person-2"), #imageLiteral(resourceName: "person-3"), #imageLiteral(resourceName: "person-4"), #imageLiteral(resourceName: "person-5")]
    let personName = ["Joana Almeida", "Pedro Carlos", "Carla Silva", "Dandara Miranda", "Fernanda Lima"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    //table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userInToggle", for: indexPath) as! UserInToggleTableViewCell
        cell.frinedName.text = personName[indexPath.row]
        return cell
    
    }
    
    //collection
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "userCollection", for: indexPath) as! UserCalendarCollectionViewCell
        cell.friendImage.image = personImage[indexPath.row]
        cell.dayOfWeek.text = daysOfWeek[indexPath.row]
        cell.friendImage.roundEdgesPhoto()
        return cell
    }

}


extension UIView {
    func roundEdgesPhoto() {
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = 40
    }
}
