//
//  CharactersModel.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 09/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import Foundation

// MARK: - CharactersModel
struct CharactersModel: Codable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let etag: String?
    let data: DataClassCharacters?

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
struct DataClassCharacters: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [ResultCharacters]?

    enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case total
        case count
        case results
    }
}

// MARK: - Result
struct ResultCharacters: Codable, Identifiable {
    let id: Int?
    let name: String?
    let resultDescription: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics: Comics?
    let series: Comics?
    let stories: Stories?
    let events: Comics?
    let urls: [URLElement]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case resultDescription
        case modified
        case thumbnail
        case resourceURI
        case comics
        case series
        case stories
        case events
        case urls
    }
}

// MARK: - Comics
struct Comics: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
    let returned: Int?

    enum CodingKeys: String, CodingKey {
        case available
        case collectionURI
        case items
        case returned
    }
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case resourceURI
        case name
    }
}

