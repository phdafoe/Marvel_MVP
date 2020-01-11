//
//  FeaturedModel.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 09/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import Foundation

// MARK: - FeaturedModel
struct FeaturedModel: Codable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let etag: String?
    let data: DataClassFeatured?

    enum CodingKeys: String, CodingKey {
        case code
        case status
        case copyright
        case attributionText
        case attributionHTML
        case etag
        case data
    }
}

// MARK: - DataClass
struct DataClassFeatured: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [ResultFeatured]?

    enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case total
        case count
        case results
    }
}

// MARK: - Result
struct ResultFeatured: Codable, Identifiable {
    let id: Int?
    let thumbnail: String?

    enum CodingKeys: String, CodingKey {
        case id
        case thumbnail
    }
}

