//
//  Router.swift
//  ImageTableViewApp
//
//  Created by Pedro Vargas on 26/02/20.
//  Copyright © 2020 Pedro Vargas. All rights reserved.
//

import Foundation
import Moya


enum Router {
    case getItems
}

extension Router: TargetType {
    var baseURL: URL {
        return URL(string: "https://demo3945028.mockable.io")!
    }
    
    var path: String {
        switch self {
        case .getItems:
            return "/image_challenge"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getItems:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getItems:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
