import SwiftUI

struct CountriesListView: View {
    @State private var countries: [Country] = []
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            List(countries, id: \.id) { country in
                VStack(alignment: .leading) {
                    Text(country.name)
                        .fontWeight(.bold)
                    Text("Code: \(country.code)")
                    Text("Currencies: \(country.currencyCodes.joined(separator: ", "))")
                }
            }
            .navigationTitle("Countries")
            .onAppear {
                APIService.shared.fetchCountries { countries, error in
                    DispatchQueue.main.async {
                        if let countries = countries {
                            self.countries = countries
                        } else if let error = error {
                            self.errorMessage = error.localizedDescription
                        }
                    }
                }
            }
        }
    }
}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
