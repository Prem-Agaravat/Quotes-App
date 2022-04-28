//  Created by Prem on 28/04/22.

import Foundation
struct Quotes: Codable {
    var quote: String
    var authorName: String
    enum CodingKeys: String, CodingKey {
        case quote = "q"
        case authorName = "a"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        quote = try values.decode(String.self, forKey: .quote)
        authorName = try values.decode(String.self, forKey: .authorName)
    }
}
