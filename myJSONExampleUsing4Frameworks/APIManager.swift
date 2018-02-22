//
//  APIManager.swift
//  myJSONExampleUsing4Frameworks
//
//  Created by hp ios on 2/21/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class APIManager
{
    static let mySingletone = APIManager()
    
    private init()
    {
        
    }
    func fetchActorsFromAPI()->Promise<[Actor]>
    {
        return Promise<[Actor]>
        {
           fullfill,reject -> Void in
           return Alamofire.request(API_URL).responseString
                {
                    (response) in
                    switch (response.result)
                    {
                    case .success(let responseString):
                        print(responseString)
                        let actorResponse = ActorApiResponse(JSONString:"\(responseString)")
                        fullfill((actorResponse?.actors)!)
                        
                    case .failure(let error):
                        print(error)
                        reject(error)
                    }
               }
        }
        
        
    }
}
