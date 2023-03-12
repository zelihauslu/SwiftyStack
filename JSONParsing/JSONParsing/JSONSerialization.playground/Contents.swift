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
[
{
"firstName" : "zeliha",
"lastName" : "uslu"
},
{
"firstName" : "salih",
"lastName" : "uslu"
}
]
"""
    .data(using: .utf8)!

do{
if let customerDictionaries = try JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [[String:Any]] {
    
    let customers = customerDictionaries.compactMap(Customer.init)
    
    print(customers)
}
        
//        let customers = dictionary.compactMap(Customer.init)
        
        
//        dictionary["firstName"]
//
//        if let customer = Customer(dictionary: dictionary){
//            print(customer)
//        }
//
//        if let ex = Example(dictionary: dictionary){
//            print(ex)
//        }
    
}

