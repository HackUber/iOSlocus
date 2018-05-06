//
//  RegisterGroupViewController.swift
//  Locus
//
//  Created by Marcelo Cristiano Araujo Silva on 06/05/2018.
//  Copyright © 2018 Locus. All rights reserved.
//

import UIKit

class RegisterGroupViewController: UIViewController {

    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var fullAddres: UITextField!
    
    @IBOutlet weak var destination: UITextField!
    
    @IBOutlet weak var hour: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func register(_ sender: Any) {
        let sharedSession = URLSession.shared
        
        if let url = URL(string: "http://localhost:3000/groups/") {
            // Create Request
            var request = URLRequest(url: url)
            
            var json = [String:Any]()
            
            json = [
                "name": self.name.text!,
                "origin": self.fullAddres.text!,
                "destination": self.destination.text!,
                "arrival_time": self.hour.date.toString(dateFormat: "HH:mm:ss"),
                "departure_time": self.hour.date.toString(dateFormat: "HH:mm:ss")
            ]
            
            let data = try! JSONSerialization.data(withJSONObject: json, options: [])
            
            request.httpMethod = "POST"
            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            // Create Data Task
            let dataTask = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                if let data = data {
                    print(String(data: data, encoding: String.Encoding.utf8)!)
                }
            })
            
            dataTask.resume()
        }
        
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
