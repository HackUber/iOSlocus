//
//  GroupViewController.swift
//  Locus
//
//  Created by Ludimila da Bela Cruz on 06/05/18.
//  Copyright © 2018 Locus. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let images = [#imageLiteral(resourceName: "job"),#imageLiteral(resourceName: "menina"),#imageLiteral(resourceName: "church"),#imageLiteral(resourceName: "grill"),#imageLiteral(resourceName: "football-field")]
    let text = ["Trabalho em Planaltina",  "Rodízio de pais", "Igreja no sádado", "Churrasco no domingo, Fut com a galera"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return text.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(integerLiteral: 80);
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groups", for: indexPath) as! GroupTableViewCell
        
        cell.imageGroup.image = images[indexPath.row]
        cell.nameGroup.text = text[indexPath.row]
        
        
        return cell
    }
    
}
