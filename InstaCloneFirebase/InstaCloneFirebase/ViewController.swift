//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Zeliha Uslu on 29.03.2023.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        if emailField.text != "" && passwordField.text != "" {
                    
                    Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (authdata, error) in
                        if error != nil {
                            self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")

                        } else {
                            self.performSegue(withIdentifier: "toFeedVC", sender: nil)

                        }
                    }
                    
                    
                } else {
                    makeAlert(titleInput: "Error!", messageInput: "Username/Password?")

                }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if emailField.text != "" && passwordField.text != "" {
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (authdata, error) in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error!.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    
                }
            }
            
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
        }
    }
    func makeAlert(titleInput:String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

