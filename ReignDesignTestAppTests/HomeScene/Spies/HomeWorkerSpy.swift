//
//  HomeWorkerSpy.swift
//  ReignDesignTestAppTests
//
//  Created by Julián Arias on 15-09-18.
//  Copyright © 2018 Maetschl. All rights reserved.
//

@testable import ReignDesignTestApp
import Foundation


class HomeWorkerSpy: HomeWorkerProtocol {

    let hackerNewsMockSearchResult = HackerNewsSearchResult(hits: [
        Hit(createdAt: "",
            title: "Test title",
            url: "https://www.reigndesign.com",
            author: "Julián Arias",
            points: nil,
            storyText: nil,
            commentText: nil,
            numComments: nil,
            storyID: nil,
            storyTitle: "Test story title",
            storyURL: nil,
            parentID: nil,
            createdAtI: 1537037970,
            tags: ["Tag1", "Tag2"],
            objectID: "101",
            highlightResult: HighlightResult(author: Author(value: "Test",
                                                            matchLevel: .none,
                                                            matchedWords: [],
                                                            fullyHighlighted: true),
                                             commentText: nil,
                                             storyTitle: nil,
                                             storyURL: nil,
                                             title: nil,
                                             url: nil)
        )],
                                                        nbHits: 1,
                                                        page: 1,
                                                        nbPages: 1,
                                                        hitsPerPage: 1,
                                                        processingTimeMS: 100,
                                                        exhaustiveNbHits: true,
                                                        query: .ios,
                                                        params: "")

    var getDataFromApiWasCalled = false
    var getDataFromApiShouldReturnError = false
    func getDataFromApi(success: @escaping ((HackerNewsSearchResult) -> Void), error: @escaping (() -> Void)) {
        getDataFromApiWasCalled = true
        if !getDataFromApiShouldReturnError {
            success(hackerNewsMockSearchResult)
        } else {
            error()
        }
    }
}
