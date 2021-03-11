//
//  NetworkService.swift
//  HammerSystemsTest
//
//  Created by Angelina on 04.02.2021.
//

import Moya
import RxSwift

enum NetworkService {
    case getTopProductsInRussia
}

extension NetworkService: TargetType {
    var baseURL: URL {
        URL(string: "https://globalapi.dodopizza.com/api/v2/dodopizza/products/top?start=2021-02-01T00:00:00&end=2021-02-02T00:00:00")!
    }
    
    var path: String {
        switch self {
        case .getTopProductsInRussia:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        let headers = ["Content-type": "application/json",
                       "Accept": "application/json"]
        return headers
    }
}
