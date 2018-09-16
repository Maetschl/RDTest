//
//  HomeInteractor.swift
//  ReignDesignTestApp
//
//  Created by Julián Arias on 15-09-18.
//  Copyright (c) 2018 Maetschl. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates: http://clean-swift.com
//

import UIKit

protocol HomeBusinessLogic {
    func getNews()
    func deleteNews(request: Home.RemoveNews.Request)
}

protocol HomeDataStore {
    var data: [News] { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    var presenter: HomePresentationLogic?
    var worker: HomeWorkerProtocol? = HomeWorker()

    // MARK: HomeDataStore
    var data: [News] = []

    // MARK: Get news
    func getNews() {
        worker?.getDataFromApi(success: { (hackerNewsSearchResult) in
            let result: [Hit] = hackerNewsSearchResult.hits
            var newsDataToPresent: [News] = []

            for news in result {
                let title = news.storyTitle ?? news.title ?? ""
                let author = news.author
                let date = news.createdAt
                let newNews = News(title: title, author: author, date: date)
                newsDataToPresent.append(newNews)
            }

            self.storeData(news: newsDataToPresent)
            self.presentData()

        }, error: {
            self.presentStoreData()
        })
    }

    // MARK: Remove news
    func deleteNews(request: Home.RemoveNews.Request) {
        data.remove(at: request.row)
        presentData()
    }

    // MARK: Private store methods
    private func storeData(news data: [News]) {
        self.data = data
        let encondedData = NSKeyedArchiver.archivedData(withRootObject: data)
        UserDefaults.standard.set(encondedData, forKey: Configurations.storeKey)
        UserDefaults.standard.synchronize()
    }

    private func presentData() {
        let response = Home.NewsList.Response(news: data)
        self.presenter?.presentNews(response: response)
    }

    // MARK: Present Store data
    private func presentStoreData() {
        let decodedData  = UserDefaults.standard.object(forKey: Configurations.storeKey) as! Data
        let news = NSKeyedUnarchiver.unarchiveObject(with: decodedData) as! [News]
        let responseFromSaveData = Home.NewsList.Response(news: news)
        self.presenter?.presentNews(response: responseFromSaveData)
    }
}
