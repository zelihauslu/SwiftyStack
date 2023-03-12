import UIKit
import Foundation

///model

struct Customer{
    var firstName : String
    var lastName : String
}

struct Example{
    var firstName : String
    var lastName : String
}

extension Customer{
    
    init?(dictionary : [String : Any]){
        
        guard let firstName = dictionary["firstName"] as? String,
              let lastName = dictionary["lastName"] as? String else {
            return nil
        }
        
        self.firstName = firstName
        self.lastName = lastName
    }
}

extension Example{
    init?(dictionary : [String : Any]){
        
        guard let firstName = dictionary["firstName"] as? String,
              let lastName = dictionary["lastName"] as? String else {
            return nil
        }
        
        self.firstName = firstName
        self.lastName = lastName
    }
}


/// parse json

let json = """
{
"firstName" : "zeliha",
"lastName" : "uslu"
}
"""
    .data(using: .utf8)!

do{
    if let dictionary = try JSONSerialization.jsonObject(with: json, options: .fragmentsAllowed) as? [String: Any]{
        dictionary["firstName"]
        
        if let customer = Customer(dictionary: dictionary){
            print(customer)
        }
        
        if let ex = Example(dictionary: dictionary){
            print(ex)
        }
    }
    
}
