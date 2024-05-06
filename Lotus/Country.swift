import Foundation

// Define a struct for the country data
struct Country: Codable, Identifiable {
    let id = UUID()
    var code: String
    var currencyCodes: [String]
    var name: String
    var wikiDataId: String
}

// Define a struct for the response
struct CountriesResponse: Codable {
    var data: [Country]
    var links: [Link]
    var metadata: Metadata
}

struct Link: Codable {
    var rel: String
    var href: String
}

struct Metadata: Codable {
    var currentOffset: Int
    var totalCount: Int
}
