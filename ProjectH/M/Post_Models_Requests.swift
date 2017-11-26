//
//  Post_Models_Requests.swift
//  Breeze-User
//
//  Created by admin on 11/1/17.
//  Copyright © 2017 CreativeMinds. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Post_Models_Requests {
    private  let sessionManager : SessionManager = {
        let con = URLSessionConfiguration.default
        con.timeoutIntervalForResource = TimeInterval(20)
        con.timeoutIntervalForRequest = TimeInterval(20)
        return  Alamofire.SessionManager(configuration: con)
    }()
    
    private  let longSessionManager : SessionManager = {
        let con = URLSessionConfiguration.default
        con.timeoutIntervalForResource = TimeInterval(60)
        con.timeoutIntervalForRequest = TimeInterval(60)
        return  Alamofire.SessionManager(configuration: con)
    }()
    
    
    func post_Default_Request(_ url:Constants.API.URLS_Post_Enum , _ parameters : [String : Any] ,  completed : @escaping ( Bool,String)->()) {
        
        let url = url.stringValue()
        print("URL is : \(url)")
        print("par, is : \(parameters)")
        
        sessionManager.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            //            print(response.result)
            switch(response.result) {
            case .success(_):
                guard response.result.error == nil, let value = response.result.value  else {
                    
                    // got an error in getting the data, need to handle it
                    //                    print("error fetching data from url")
                    print(response.result.error?.localizedDescription)
                    completed(false , "")
                    return
                    
                }
                let json = JSON( value) // SwiftyJSON
                print("that is  getMenuData getting the data Mate : %@", response.result.value)
                let parm = Constants.API.Parameters()
                
//                let status = json[parm.message].string != nil ? true : false
//                let sms = json[parm.message].string ?? json[parm.error][parm.message].stringValue
                //                print("that's \(status)that's status \(sms)")
            
                completed(  true ,"")
                break
                
            case .failure(_) :
                //                             if let data = response.data {
                //                               let json = String(data: data, encoding: String.Encoding.utf8)
                //                                 print("Failure Response: \(json)")
                //                              }
                print("Failer: \(String(describing: response.result.error?.localizedDescription))")
                //
                let json = ""
                completed( false ,"")
                break
            }
        }
    }
    
    
}
