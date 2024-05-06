import Foundation

class APIService {
    static let shared = APIService()
    
    func fetchCountries(completion: @escaping ([Country]?, Error?) -> Void) {
        let headers = [
            "X-RapidAPI-Key": "99cb200b8cmsh0741099fb193dd3p16c2f1jsn5ac8dcf147c8",
            "X-RapidAPI-Host": "wft-geo-db.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/countries")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let countriesResponse = try decoder.decode(CountriesResponse.self, from: data)
                completion(countriesResponse.data, nil)
            } catch let decodingError {
                completion(nil, decodingError)
            }
        }
        
        dataTask.resume()
    }
}
