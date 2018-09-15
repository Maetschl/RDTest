//
//  HackerNewsSearchResult.swift
//  ReignDesignTestApp
//
//  Created by Julián Arias on 15-09-18.
//  Copyright © 2018 Maetschl. All rights reserved.
//
//  To parse the JSON, add this file to your project and do:
//  This files as been generated with https://app.quicktype.io/
//  Base on response of hackers news API from: https://hn.algolia.com/api/v1/search_by_date?query=ios
//  Example of use:
//  let hackerNewsSearchResult = try? newJSONDecoder().decode(HackerNewsSearchResult.self, from: jsonData)

import Foundation

struct HackerNewsSearchResult: Codable {
    let hits: [Hit]
    let nbHits, page, nbPages, hitsPerPage: Int
    let processingTimeMS: Int
    let exhaustiveNbHits: Bool
    let query: Query
    let params: String
}

struct Hit: Codable {
    let createdAt: String
    let title: String?
    let url: String?
    let author: String
    let points: Int?
    let storyText: JSONNull?
    let commentText: String?
    let numComments, storyID: Int?
    let storyTitle: String?
    let storyURL: String?
    let parentID: Int?
    let createdAtI: Int
    let tags: [String]
    let objectID: String
    let highlightResult: HighlightResult

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case title, url, author, points
        case storyText = "story_text"
        case commentText = "comment_text"
        case numComments = "num_comments"
        case storyID = "story_id"
        case storyTitle = "story_title"
        case storyURL = "story_url"
        case parentID = "parent_id"
        case createdAtI = "created_at_i"
        case tags = "_tags"
        case objectID
        case highlightResult = "_highlightResult"
    }
}

struct HighlightResult: Codable {
    let author: Author
    let commentText, storyTitle, storyURL, title: Author?
    let url: Author?

    enum CodingKeys: String, CodingKey {
        case author
        case commentText = "comment_text"
        case storyTitle = "story_title"
        case storyURL = "story_url"
        case title, url
    }
}

struct Author: Codable {
    let value: String
    let matchLevel: MatchLevel
    let matchedWords: [Query]
    let fullyHighlighted: Bool?
}

enum MatchLevel: String, Codable {
    case full = "full"
    case none = "none"
}

enum Query: String, Codable {
    case ios = "ios"
}

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
