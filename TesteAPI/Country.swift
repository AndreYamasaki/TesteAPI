//
//  Country.swift
//  TesteAPI
//
//  Created by user191918 on 5/15/21.
//

import Foundation

struct Country: Decodable {
    var name: String?
    var capital: String?
    var countryCode: String?
}

enum CondingKeys: String, CodingKey {
    case name = "name"
    case capital = "capital"
    case countryCode = "alpha3Code"
}
