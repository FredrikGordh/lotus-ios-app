//
//  Hotel.swift
//  Lotus
//
//  Created by Fredrik Gordh Riseby on 5/5/24.
//

import Foundation


struct hotel: Decodable, Identifiable {
    var id: String
    var name: String
    var posName: String
    var hcomLocale: String
}
