import Foundation



class hotelViewModel: ObservableObject {
    @Published var hotels = [hotel]() // Assuming `hotel` is a struct representing your data
    @Published var isLoading = false

    func loadHotels() {
        isLoading = true
        NetworkManager.shared.fetchHotels { hotels, error in
            self.isLoading = false
            if let error = error {
                // Handle error
                print("Error: \(error.localizedDescription)")
                return
            }
            if let hotels = hotels {
                self.hotels = hotels
                print("Trying to load hotels...")
                print(hotels)
                print("Loaded hotels: \(hotels)")
            }
        }
    }
}
