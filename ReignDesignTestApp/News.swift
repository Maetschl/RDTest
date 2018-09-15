//
//  News.swift
//  ReignDesignTestApp
//
//  Created by Julián Arias on 15-09-18.
//  Copyright © 2018 Maetschl. All rights reserved.
//

import Foundation

class News: NSObject, NSCoding {

    var title: String = ""
    var author: String = ""
    var date: String = ""

    struct Keys {
        static let title = "title"
        static let author = "author"
        static let date = "date"
    }

    init(title: String, author: String, date: String) {
        self.title = title
        self.author = author
        self.date = date
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: Keys.title)
        aCoder.encode(author, forKey: Keys.author)
        aCoder.encode(date, forKey: Keys.date)
    }

    required init?(coder aDecoder: NSCoder) {
        if let title = aDecoder.decodeObject(forKey: Keys.title) as? String { self.title = title }
        if let author = aDecoder.decodeObject(forKey: Keys.author) as? String { self.author = author }
        if let date = aDecoder.decodeObject(forKey: Keys.date) as? String { self.date = date }
    }
}
