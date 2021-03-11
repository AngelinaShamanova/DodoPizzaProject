//
//  TopProductsModel.swift
//  HammerSystemsTest
//
//  Created by Angelina on 04.02.2021.
//

import Foundation

struct TopProductsModel: Decodable {
    let countries: [Countries]
}

struct Countries: Decodable {
    let countryId: Int
    let countryCode: String
    let countryName: String
    let products: [Products]
}

struct Products: Decodable {
    let name: String
    let ordersCount: Int
    let images: [Images]
}

struct Images: Decodable {
    let size: Int
    let urls: [String]
}
