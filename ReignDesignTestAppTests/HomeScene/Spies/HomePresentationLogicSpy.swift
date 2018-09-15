//
//  HomePresentationLogicSpy.swift
//  ReignDesignTestAppTests
//
//  Created by Julián Arias on 15-09-18.
//  Copyright © 2018 Maetschl. All rights reserved.
//

@testable import ReignDesignTestApp
import Foundation

class HomePresentationLogicSpy: HomePresentationLogic {
    var presentSomethingCalled = false

    func presentNews(response: Home.NewsList.Response) {
        presentSomethingCalled = true
    }
}
