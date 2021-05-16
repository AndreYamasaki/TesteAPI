//
//  Service.swift
//  TesteAPI
//
//  Created by user191918 on 5/15/21.
//

import Foundation
import Alamofire

class Service{
    //https://restcountries.eu/rest/v2/
    fileprivate var baseUrl = ""
    typealias countriesCallBack = (_ countries: [Country]?, _ status: Bool, _ massage: String) -> Void
    var callBack: countriesCallBack?
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    //MARK:- Get all country names
    func getCountryNameFrom(endPoint: String)  {
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            (responseData) in
            guard let data = responseData.data else {
                self.callBack?(nil, false, "")
                return}
            do {
            let countries = try JSONDecoder().decode([Country].self, from: data)
                self.callBack?(countries, true, "")
            } catch {
                self.callBack?(nil, false, error.localizedDescription)
            }
    }
}
    func completionHandler(callBack: @escaping countriesCallBack){
        self.callBack = callBack
    }
}
