import Foundation

class NetworkManager {
    static let shared = NetworkManager()  // Singleton instance
    
    func fetchHotels(completion: @escaping ([hotel]?, Error?) -> Void) {
        
        let headers = [
            "X-RapidAPI-Key": "99cb200b8cmsh0741099fb193dd3p16c2f1jsn5ac8dcf147c8",
            "X-RapidAPI-Host": "hotels4.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://hotels4.p.rapidapi.com/v2/get-meta-data")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
        
        dataTask.resume()
    }
}
