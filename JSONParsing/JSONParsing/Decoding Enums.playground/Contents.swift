import UIKit

enum AddressType : String, Decodable {
    case apartment = "apartment"
    case house = "house"
    case condo = "condo"
    case townHouse = "townHouse"
}

struct Geo : Decodable {
    var latitude :Double
    var longitude :Double
}

struct Address : Decodable {
    var street :String
    var city :String
    var state :String
    var geo :Geo
    var addressType :AddressType
}


struct Customer : Decodable {
    var firstName :String
    var lastName :String
    var address :Address
}

struct CustomersResponse :Decodable {
    var customers :[Customer]
}


let json = """

{
    "customers":[
        {
            "firstName" : "John",
            "lastName" : "Doe",
            "address" : {
                "street" : "1200 Richmond Ave",
                "city" : "Houston",
                "state" : "TX",
                "geo" : {
                    "latitude" : 34.56,
                    "longitude" : 35.65
                },
                "addressType" : "condo"
            }
        }
    
    ]

}

""".data(using: .utf8)!

let customersResponse = try! JSONDecoder().decode(CustomersResponse.self, from: json)
print(customersResponse)
print(customersResponse.customers[0].address.addressType.rawValue)





