//
//  HomeDisplayLogicSpy.swift
//  ReignDesignTestAppTests
//
//  Created by Julián Arias on 15-09-18.
//  Copyright © 2018 Maetschl. All rights reserved.
//

@testable import ReignDesignTestApp
import Foundation

class HomeDisplayLogicSpy: HomeDisplayLogic {
    var displayNewsWasCalled = false

    func displayNews(viewModel: Home.NewsList.ViewModel) {
        displayNewsWasCalled = true
    }
}
