//
//  SeriesModel.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 09/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import Foundation

// MARK: - SeriesModel
struct SeriesModel: Codable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let etag: String?
    let data: DataClassSeries?

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
struct DataClassSeries: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [ResultSeries]?

    enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case total
        case count
        case results
    }
}

// MARK: - Result
struct ResultSeries: Codable, Identifiable {
    let id: Int?
    let title: String?
    let resultDescription: String?
    let resourceURI: String?
    let urls: [URLElement]?
    let startYear: Int?
    let endYear: Int?
    let rating: String?
    let type: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let creators: Creators?
    let characters: CharactersSeries?
    let stories: Stories?
    let comics: CharactersSeries?
    let events: Events?
    let next: Next?
    let previous: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case resultDescription
        case resourceURI
        case urls
        case startYear
        case endYear
        case rating
        case type
        case modified
        case thumbnail
        case creators
        case characters
        case stories
        case comics
        case events
        case next
        case previous
    }
}

// MARK: - Characters
struct CharactersSeries: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [Next]?
    let returned: Int?

    enum CodingKeys: String, CodingKey {
        case available
        case collectionURI
        case items
        case returned
    }
}

// MARK: - Next
struct Next: Codable {
    let resourceURI: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case resourceURI
        case name
    }
}











