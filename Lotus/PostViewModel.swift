////
////  PostViewModel.swift
////  Lotus
////
////  Created by Fredrik Gordh Riseby on 5/5/24.
////
//
//import Foundation
//import Combine
//
//
//class PostViewModel: ObservableObject {
//    @Published var posts: [Post] = []
//    @Published var isLoading = false
//    
//    func fetchMoviesFromAPI() -> [Movie] {
//        
//
//
//        
//    }
//    
//    func fetchPosts() {
//            isLoading = true
//            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
//                print("Invalid URL")
//                return
//            }
//
//            URLSession.shared.dataTask(with: url) { data, _, error in
//                DispatchQueue.main.async {
//                    self.isLoading = false
//                    if let data = data {
//                        if let decodedResponse = try? JSONDecoder().decode([Post].self, from: data) {
//                            self.posts = decodedResponse
//                        } else {
//                            print("Decoding failed")
//                        }
//                    } else if let error = error {
//                        print("HTTP Request failed \(error)")
//                    }
//                }
//            }.resume()
//        }
//}
