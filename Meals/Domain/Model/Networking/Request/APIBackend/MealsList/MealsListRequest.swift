//
//  MealsListRequest.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Foundation

struct MealListRequest: APIRequest {
    
    typealias Response = MealListResponse
    
    let data: MealsListReqParams
    
    init(data: MealsListReqParams) {
        self.data = data
    }
    
    var apiType: ApiType {
        return .backend
    }
    
    var method: HTTPMethodType {
        return .get
    }
    
    var path: String {
        return "/search.php"
    }
    
    var bodyEncoding: BodyEncoding {
        return .jsonSerializationData
    }
    
    var headerParamaters: [String : String] {
        return [:]
    }
    
    var bodyParamaters: [String : Any] {
        return [:]
    }
    
    var queryParameters: [String : String] {
        return ["f" : self.data.category]
    }
}
