//
//  RequestManager.swift
//  NewsApp2
//
//  Created by Nikita Popov on 21.02.2021.
//

import UIKit


protocol RequestManagerDelegate{
    func didUpdateData(_ requestManager: RequestManager, newsArray: [News])
    var totalResults: Int { get set }
    var currentResultsCount: Int { get set }
}


class RequestManager{
    
    var delegate: RequestManagerDelegate?
    
    func fetchData(withURL url: String, pageNumber: Int = 1){
        
        let urlString = URL(string: url + String(pageNumber))
        var articlesArray = [News]()
        guard let url = urlString else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil{
                print(error.debugDescription)
                return
            }else if data != nil{
                do{
                    let newsData = try JSONDecoder().decode(APIResponse<[News]>.self, from: data!)
                    if newsData.status == "ok"{
//                        var articlesArray = [News]()
                        articlesArray.append(contentsOf: newsData.articles!)
                        print(articlesArray.count)
                        self.delegate?.totalResults = newsData.totalResults ?? 1
                        self.delegate?.didUpdateData(self, newsArray: articlesArray)
                    }
                }catch let error{
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}


