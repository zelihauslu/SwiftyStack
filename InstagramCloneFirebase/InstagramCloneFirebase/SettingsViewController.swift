//
//  SettingsViewController.swift
//  InstagramCloneFirebase
//
//  Created by Zeliha Uslu on 28.03.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOut(_ sender: Any) {
        performSegue(withIdentifier: "ToViewController", sender: nil)
    }
    
    @IBAction func SignOut(_ sender: Any) {
        performSegue(withIdentifier: "ToViewController", sender: nil)
    }
    
    
}
