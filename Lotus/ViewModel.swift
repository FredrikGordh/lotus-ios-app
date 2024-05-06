import Foundation



class ViewModel: ObservableObject {
    @Published var countries = [country]() // Assuming `country` is a struct representing your data
    @Published var isLoading = false

    func loadCountries() {
        isLoading = true
        NetworkManager.shared.fetchData(from: .countries) { data, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let countryResponse = try JSONDecoder().decode(CountryResponse.self, from: data)
                
                // Access the parsed data
                let countries = countryResponse.data
                let links = countryResponse.links
                let metadata = countryResponse.metadata
                
                // Process the data as needed
                for country in countries {
                    print("Country: \(country.name), Code: \(country.code), Currency Codes: \(country.currencyCodes)")
                }
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }

    }
}
