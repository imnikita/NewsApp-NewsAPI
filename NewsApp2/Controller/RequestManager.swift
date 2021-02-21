//
//  RequestManager.swift
//  NewsApp2
//
//  Created by Nikita Popov on 21.02.2021.
//

import UIKit


struct RequestManager{
    
    func fetchData(){
        
        guard let url = URL(string: Utilities().URL) else {
            return
        }
        let params = "pageSize=15"
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = params.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil{
                print(error.debugDescription)
                return
            }else if data != nil{
                let stringData = String(data: data!, encoding: .utf8)
                print(stringData as! String)
            }
        }
        task.resume()
    }
    
    
    
    
    
    
}
