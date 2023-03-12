import UIKit
import Foundation

/// parse json

let json = """
{
"firstName" : "zeliha",
"lastName" : "uslu"
}
"""
    .data(using: .utf8)!

do{
    if let jsonData = try JSONSerialization.jsonObject(with: json, options: .fragmentsAllowed) as? [String: Any]{
        jsonData["firstName"]
    }

}
