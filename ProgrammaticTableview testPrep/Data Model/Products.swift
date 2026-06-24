
import UIKit

struct Products: Decodable{
    let products: [Phone]
}

struct Phone: Decodable{
    let id : Int
    let title: String
    let description: String
    let images: [String?]
}
