//
//  SettingsViewController.swift
//  InstaCloneFirebase
//
//  Created by Zeliha Uslu on 30.03.2023.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func logOutClicked(_ sender: Any) {
        do{
            try  Auth.auth().signOut()
            self.performSegue(withIdentifier: "toLoginVC", sender: nil)
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
