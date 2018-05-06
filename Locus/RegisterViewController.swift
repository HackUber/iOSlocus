//
//  RegisterViewController.swift
//  Locus
//
//  Created by Marcelo Cristiano Araujo Silva on 06/05/2018.
//  Copyright © 2018 Locus. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var userImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RegisterUser(_ sender: Any) {
        let sharedSession = URLSession.shared
        
        if let url = URL(string: "http://localhost:3000/users/") {
            // Create Request
            var request = URLRequest(url: url)
            
            var json = [String:Any]()

            json = [
                "email": self.email.text!,
                "phone_number": self.phone.text!,
                "password": self.password.text!
            ]

            let data = try! JSONSerialization.data(withJSONObject: json, options: [])

            request.httpMethod = "POST"
            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
//            request.addValue("Token " + id, forHTTPHeaderField: "Authorized")

            // Create Data Task
            let dataTask = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                if let data = data {
                    print(String(data: data, encoding: String.Encoding.utf8)!)
                }
            })
            
            dataTask.resume()
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
