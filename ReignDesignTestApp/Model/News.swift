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
    var url: String = ""
    var id: String = ""

    struct Keys {
        static let title = "title"
        static let author = "author"
        static let date = "date"
        static let url = "url"
        static let id = "id"
    }

    init(id: String, title: String, author: String, date: String, url: String) {
        self.id = id
        self.title = title
        self.author = author
        self.date = date
        self.url = url
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: Keys.id)
        aCoder.encode(title, forKey: Keys.title)
        aCoder.encode(author, forKey: Keys.author)
        aCoder.encode(date, forKey: Keys.date)
        aCoder.encode(url, forKey: Keys.url)
    }

    required init?(coder aDecoder: NSCoder) {
        if let id = aDecoder.decodeObject(forKey: Keys.id) as? String { self.id = id }
        if let title = aDecoder.decodeObject(forKey: Keys.title) as? String { self.title = title }
        if let author = aDecoder.decodeObject(forKey: Keys.author) as? String { self.author = author }
        if let date = aDecoder.decodeObject(forKey: Keys.date) as? String { self.date = date }
        if let url = aDecoder.decodeObject(forKey: Keys.url) as? String { self.url = url }
    }
}
