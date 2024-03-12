//
//  AlamoNetwork.swift
//  HometaskTable
//
//  Created by Bekarys Sandigali on 12.03.2024.
//

import Foundation
import Alamofire

class AlamoNetwork {
    static let shared = AlamoNetwork()
    func getApi(completion: @escaping(Dar?)->Void){
        let url = URL(string:"https://swapi.py4e.com/api/people/")!
        AF.request(url).response { response in
            if let data = response.data {
                let decoder = JSONDecoder()
                
                do {
                    let act = try decoder.decode(Dar.self ,from: data)
                    completion(act)
                    return
                } catch {
                    completion(nil)
                    print(error)
                }
                
            }
        }
    }
}

