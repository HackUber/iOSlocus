//
//  GroupViewController.swift
//  Locus
//
//  Created by Ludimila da Bela Cruz on 06/05/18.
//  Copyright © 2018 Locus. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    let images = [#imageLiteral(resourceName: "job"), #imageLiteral(resourceName: "grill"), #imageLiteral(resourceName: "football-field"),#imageLiteral(resourceName: "doctor"), #imageLiteral(resourceName: "church"), #imageLiteral(resourceName: "menina")]
    var text = NSArray()
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let sharedSession = URLSession.shared
        
        if let url = URL(string: "http://localhost:3000/groups/") {
            // Create Request
            var request = URLRequest(url: url)
            request.addValue("Token 1", forHTTPHeaderField: "Authorized")

            let dataTask = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                if error == nil, let data = (try? JSONSerialization.jsonObject(with: data!, options: [])) {
                    print(data)
                    self.text = data as! NSArray
//                    print(self.text)
                    
                    OperationQueue.main.addOperation {
                        self.myTableView.reloadData()
                    }
                }
            })
            
            dataTask.resume()
        }
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
        cell.nameGroup.text = (text[indexPath.row] as AnyObject)["name"] as? String
        
        return cell
    }
    
}
