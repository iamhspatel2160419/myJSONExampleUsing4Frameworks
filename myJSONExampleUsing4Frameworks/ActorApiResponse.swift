//
//  ActorApiResponse.swift
//  myJSONExampleUsing4Frameworks
//
//  Created by hp ios on 2/21/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import Foundation
import ObjectMapper

class ActorApiResponse:Mappable
{
    var actors: [Actor]?
    
     required init?(map: Map)
     {
        
     }
     func mapping(map: Map)
     {
        actors <- map["actors"]
    }
    
    
}
class Actor:Mappable
{
    var name : String?
    var dob:String?
    var country:String?
    var height:String?
    var description:String?
    var spouse:String?
    var children:String?
    var image:String?
    
    required init?(map: Map)
    {
        
    }
    func mapping(map: Map)
    {
        name <- map["name"]
        dob <- map["dob"]
        country <- map["country"]
        height <- map["height"]
        description <- map["description"]
        spouse <- map["spouse"]
        children <- map["children"]
        image <- map["image"]
    }
}
