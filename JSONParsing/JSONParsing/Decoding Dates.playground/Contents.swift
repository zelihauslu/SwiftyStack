import UIKit

// reference - useyourloaf.com
extension DateFormatter {
    static let iso8601Full :DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyy"
        return formatter
    }()
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
}


struct Customer : Decodable {
    var firstName :String
    var lastName :String
    var address :Address
    var dateCreated :Date
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
            "dateCreated" : "05/09/2018",
            "address" : {
                "street" : "1200 Richmond Ave",
                "city" : "Houston",
                "state" : "TX",
                "geo" : {
                    "latitude" : 34.56,
                    "longitude" : 35.65
                }
            }
        }
    
    ]

}

""".data(using: .utf8)!

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)


let customerResponse = try! decoder.decode(CustomersResponse.self, from: json)
print(customerResponse)


