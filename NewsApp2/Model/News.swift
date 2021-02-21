//
//  DataModel.swift
//  NewsApp2
//
//  Created by Nikita Popov on 21.02.2021.
//

import UIKit

struct News: Codable {
    let author: String?
    let title: String?
    let url: URL?
    let urlToImage: URL?
    let publishedAt: String?
    let resultsTotalCount: Int?
}

struct APIResponse<T : Codable> : Codable {
    let status: String?
    let totalResults: Int?
    let articles: T?
}

