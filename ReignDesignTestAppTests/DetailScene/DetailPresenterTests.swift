//
//  DetailPresenterTests.swift
//  ReignDesignTestApp
//
//  Created by Julián Arias on 16-09-18.
//  Copyright (c) 2018 Maetschl. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates from: http://clean-swift.com
//

@testable import ReignDesignTestApp
import XCTest

class DetailPresenterTests: XCTestCase {
    // MARK: Subject under test

    var sut: DetailPresenter!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupDetailPresenter()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupDetailPresenter() {
        sut = DetailPresenter()
    }

    // MARK: Test doubles

    class DetailDisplayLogicSpy: DetailDisplayLogic {
        var displayWebWasCalled = false
        func displayWeb(viewModel: Detail.WebView.ViewModel) {
            displayWebWasCalled = true
        }
    }

    // MARK: Tests

    func testPresentSomething() {
        // Given
        let spy = DetailDisplayLogicSpy()
        sut.viewController = spy
        let response = Detail.WebView.Response(url: URL(string: Configurations.baseUrl)!)

        // When
        sut.presentUrl(response: response)

        // Then
        XCTAssertTrue(spy.displayWebWasCalled)
    }
}
