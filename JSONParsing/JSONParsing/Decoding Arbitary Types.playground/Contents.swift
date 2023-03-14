import UIKit

struct AnyDecodable : Decodable {
    
    let value :Any
    
    init<T>(_ value :T?) {
        self.value = value ?? ()
    }
    
    init(from decoder :Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        
        if let string = try? container.decode(String.self) {
            self.init(string)
        } else if let int = try? container.decode(Int.self) {
            self.init(int)
        } else {
            self.init(())
        }
        
    }
    
}

let json = """

{
   "foo" : "Hello",
   "bar" : 123
}

""".data(using: .utf8)!

let dictionary = try! JSONDecoder().decode([String:AnyDecodable].self, from: json)
dictionary["bar"]?.value
