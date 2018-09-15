//
//  HomeModels.swift
//  ReignDesignTestApp
//
//  Created by Julián Arias on 15-09-18.
//  Copyright (c) 2018 Maetschl. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates: http://clean-swift.com
//

import UIKit

enum Home {
    // MARK: Get news
    enum NewsList {
        struct Request {
        }
        struct Response {
            var news: [News]
        }
        struct ViewModel {
            struct NewsDisplayedData {
                var title: String
                var info: String
            }
            var news: [NewsDisplayedData]
        }
    }
}
