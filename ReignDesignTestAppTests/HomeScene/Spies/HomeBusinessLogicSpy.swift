//
//  HomeBusinessLogicSpy.swift
//  ReignDesignTestAppTests
//
//  Created by Julián Arias on 15-09-18.
//  Copyright © 2018 Maetschl. All rights reserved.
//

@testable import ReignDesignTestApp
import Foundation

class HomeBusinessLogicSpy: HomeBusinessLogic {
    var deleteNewsWasCalled = false
    func deleteNews(request: Home.RemoveNews.Request) {
        deleteNewsWasCalled = true
    }

    var getNewsWasCalled = false
    func getNews() {
        getNewsWasCalled = true
    }
}
