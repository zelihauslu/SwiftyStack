//
//  ViewController.swift
//  InstagramCloneFirebase
//
//  Created by Zeliha Uslu on 28.03.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logInClicked(_ sender: Any) {
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        performSegue(withIdentifier: "ToFeedVC", sender: nil)

    }
}

