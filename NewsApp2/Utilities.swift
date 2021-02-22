//
//  Utilities.swift
//  NewsApp2
//
//  Created by Nikita Popov on 21.02.2021.
//

import UIKit


var pageNumber = 1
var requestUrl = "https://newsapi.org/v2/top-headlines?country=ua&apiKey=cc6c9b9fc61c4581bf67bfdd4a7972a0&pageSize=10&page="

let deffiniteImageURL: URL! = URL(string: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fregion-news.kr.ua%2F&psig=AOvVaw2p6PahqYT_Id5MYAR5gI9Z&ust=1614026044749000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLDL89zp--4CFQAAAAAdAAAAABAD")

//struct Utilities {
//    var URL = "https://newsapi.org/v2/top-headlines?country=ua&apiKey=cc6c9b9fc61c4581bf67bfdd4a7972a0&pageSize=5&"
//}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
