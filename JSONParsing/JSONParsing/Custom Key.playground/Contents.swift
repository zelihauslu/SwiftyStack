import UIKit
 
struct User: Decodable {
    let name: String
    let age: Int
}
 
struct AnyKey: CodingKey {
    
    var stringValue: String
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    init?(intValue: Int) {
        return nil
    }
}
 
struct DecodingStrategy {
    
    static var firstUpperCaseLetter: ([CodingKey]) -> CodingKey {
        return { keys -> CodingKey in
            let key = keys.first!
            let modifiedKey = key.stringValue.prefix(1).lowercased() + key.stringValue.dropFirst()
            return AnyKey(stringValue: modifiedKey)!
        }
    }
    
}
 
let json = """
    {
        "Name": "John Doe",
        "Age": 34
    }
"""
 
guard let jsonData = json.data(using: .utf8) else {
    throw fatalError("Unable to get data!")
}
 
let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .custom(DecodingStrategy.firstUpperCaseLetter)
 
let user = try? decoder.decode(User.self, from: jsonData)
print(user)
