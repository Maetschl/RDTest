//
//  HomeWorkerTests.swift
//  ReignDesignTestApp
//
//  Created by Julián Arias on 15-09-18.
//  Copyright (c) 2018 Maetschl. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import ReignDesignTestApp
import XCTest

class HomeWorkerTests: XCTestCase {
    // MARK: Subject under test

    var sut: HomeWorker!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupHomeWorker()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupHomeWorker() {
        sut = HomeWorker()
    }

    // MARK: Test doubles

    // MARK: Tests

    func testSomething() {
        // Given

        // When

        // Then
    }
}