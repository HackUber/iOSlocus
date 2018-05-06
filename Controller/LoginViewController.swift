//
//  LoginViewController.swift
//  Locus
//
//  Created by Ludimila da Bela Cruz on 06/05/18.
//  Copyright © 2018 Locus. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var entreyButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.entreyButton.roundEdges()
        self.passwordTextField.roundEdges()
        self.loginTextField.roundEdges()
    }
}

extension UIViewController {
    func removeNavBarLine(){
        let navigationBar = navigationController?.navigationBar
        navigationBar?.isTranslucent = false
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
    }
 func setNavigationBarColor (color: UIColor) {
     self.removeNavBarLine()
     navigationController?.navigationBar.barTintColor = color
    }
}

extension UIView {
    func roundEdges() {
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = 20
    }
}
