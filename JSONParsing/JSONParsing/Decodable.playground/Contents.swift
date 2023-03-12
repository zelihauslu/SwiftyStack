import UIKit

struct Customer : Decodable{
    var firstName : String
    var lastName : String
    var age : Int
    
    /// decodable doing those stuffs:
    
//    private enum CodingKeys : String, CodingKey{
//        case firstName
//        case lastName
//        case age
//    }
//
//    init(from decoder : Decoder) throws{
//
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.firstName = try container.decode(String.self, forKey: .firstName)
//        self.lastName = try container.decode(String.self, forKey: .lastName)
//        self.age = try container.decode(Int.self, forKey: .age)
//    }
}


let json = """
{
"firstName" : "Zeliha",
"lastName" : "Uslu",
"age" : 20
}
"""
    .data(using: .utf8)!


let customer = try! JSONDecoder().decode(Customer.self, from: json)
    print(customer)

