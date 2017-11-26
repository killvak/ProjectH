//
//  Get_Model_Requests.swift
//  Breeze-User
//
//  Created by admin on 11/1/17.
//  Copyright © 2017 CreativeMinds. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
 
class Get_Model_Requests {
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
    private   let source = Constants.API.Parameters()

   
    
    
    func getHomeData( _ pageNum : Int , completed : @escaping ( [HomePage_Model]?,Bool)->()) {
        
        var url = Constants.API.URLS_Get_Enum.HomePage.stringValue()
        if pageNum != 1 {
            url = url + "/page/\(pageNum)"
        }
        print("getHomeData URL is : \(url)")

        sessionManager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constants.HEADER).responseJSON { (response:DataResponse<Any>) in
            //            print(response.result)
            switch(response.result) {
            case .success(_):
                guard response.result.error == nil, let value = response.result.value  else {
                    
                    // got an error in getting the data, need to handle it
                    //                    print("error fetching data from url")
                    print(response.result.error?.localizedDescription)
                    completed(nil, false )
                    return
                    
                }
                let json = JSON( value) // SwiftyJSON
                print("that is  getMenuData getting the data Mate : %@", response.result.value)
                let parm = Constants.API.Parameters()
                
//                let status = json[parm.message].string != nil ? true : false
//                let sms = json[parm.message].string ?? json[parm.error][parm.message].stringValue
                //                print("that's \(status)that's status \(sms)")
                
                completed(  nil , false )
                break
                
            case .failure(_) :
                //                             if let data = response.data {
                //                               let json = String(data: data, encoding: String.Encoding.utf8)
                //                                 print("Failure Response: \(json)")
                //                              }
                print("Failer: \(String(describing: response.result.error?.localizedDescription))")
                //
                let json = ""
                completed( nil , false)
                break
            }
        }
    }
    
   
//     func getOrderData(  completed : @escaping ( Orders_Data?,Bool)->()) {
//        
//        let url = Constants.API.URLS_Get_Enum.Orders.stringValue() 
////        print("URL: is getOrderData URL : \(url)")
////        print("\n\nHeader is \(Constants.HEADER)")
//        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject { (response: DataResponse<OrdersDetails>)  in
//            //            print(response.result)
//            switch(response.result) {
//            case .success(_):
//                guard response.result.error == nil, let value = response.result.value  else {
// 
//                    //                    print(response.result.error?.localizedDescription)
//                    completed(nil  , false)
//                     return
//                 }
//                 let dataR = response.result.value
////               print("that is  getOrderData getting the data Mate : %@", dataR?.current_page)
//                guard let data = dataR?.orders_Data  , data.count >= 1 else {  completed(nil  , false);return }
//                completed( data[0], true )
//                break
//                
//            case .failure(_) :
//                //                             if let data = response.data {
//                //                               let json = String(data: data, encoding: String.Encoding.utf8)
//                //                                 print("Failure Response: \(json)")
//                //                              }
//                print("that is fail i n getting the getOrderData data Mate : \(response.result.error?.localizedDescription)")
//                //
//                completed( nil,  false )
//                break
//            }
//        }
//    }
//    
//    func getAllOrders(  completed : @escaping ( [Orders_Data]?,Bool)->()) {
//        
//        let url = Constants.API.URLS_Get_Enum.AllOrders.stringValue()
//        print("URL: is getAllOrders URL : \(url)")
////        print("\n\nHeader is \(Constants.HEADER)")
//        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject { (response: DataResponse<OrdersDetails>)  in
//            //            print(response.result)
//            switch(response.result) {
//            case .success(_):
//                guard response.result.error == nil, let value = response.result.value  else {
//                    
//                    //                    print(response.result.error?.localizedDescription)
//                    completed(nil  , false)
//                    return
//                }
//                let dataR = response.result.value
//                print("that is  getOrderData getting the data Mate : %@", dataR)
//                guard let data = dataR?.orders_Data  , data.count >= 1 else {  completed(nil  , false);return }
//                completed( data, true )
//                break
//                
//            case .failure(_) :
//                //                             if let data = response.data {
//                //                               let json = String(data: data, encoding: String.Encoding.utf8)
//                //                                 print("Failure Response: \(json)")
//                //                              }
//                print("that is fail i n getting the getOrderData data Mate : \(response.result.error?.localizedDescription)")
//                //
//                completed( nil,  false )
//                break
//            }
//        }
//    }
//    
//    
//    func getPlaceData(_ id : Int,_ completed : @escaping (PlaceDetails?)->()){
//        
//        let url = Constants.API.URLS_Get_Enum.Place_Details.stringValue() + "\(id)"
//        print(url)
//        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constants.HEADER).responseObject{ (response:DataResponse<PlaceDetails>) in
//            switch(response.result) {
//            case .success(_):
//                guard response.result.error == nil, let value = response.result.value  else {
//                    completed(nil)
//                    return
//                }
//                let data:PlaceDetails? = response.result.value
//                completed( data)
//                break
//                
//            case .failure(_) :
//                print("that is fail i n getting the getPlaceData data Mate : \(response.result.error?.localizedDescription)")
//                completed(nil)
//                break
//            }
//        }
//        
//    }
// 
//    
//    
//  
//    func getUserAddresses(  completed : @escaping ( [Addresses_Details]?,Bool)->()) {
//        
//        let url = Constants.API.URLS_Get_Enum.Addresses.stringValue() + "20"
//        print("URL: is getCategoriesList URL : \(url)")
//        print("\n\nHeader is \(Constants.HEADER)")
//        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constants.HEADER).responseJSON { (response:DataResponse<Any>) in
//            //            print(response.result)
//            switch(response.result) {
//            case .success(_):
//                guard response.result.error == nil, let value = response.result.value  else {
//                    
//                    // got an error in getting the data, need to handle it
//                    //                    print("error fetching data from url")
//                    //                    print(response.result.error?.localizedDescription)
//                    completed(nil  , false)
//                    
//                    return
//                    
//                }
//                let json = JSON( value) // SwiftyJSON
//                                print("that is  getMenuData getting the data Mate : %@", response.result.value)
//                let parm = Constants.API.Parameters()
//                var data = [Addresses_Details]()
//                for (_,jsn) in json[parm.data] {
//                    data.append(Addresses_Details(jsn))
//                }
//                //                let data = User_DataModel(json[parm.data])
//                //                let statusCode = json[parm.error][parm.status_code].intValue
//                let status = data.count >= 1 ? true : false
//                //                //                print("that's \(data.email)that's status \(statusCode)")
//                //                let sms =   json[parm.error]["message"].string ?? "Done"
//                ////                print("that's timeline : \(data.timeSlots) email : \(data.email) /n id : \(data.id)that's status \(statusCode) status \(status) sms: \(sms)////")
//                //
//                completed( data, status )
//                break
//                
//            case .failure(_) :
//                //                             if let data = response.data {
//                //                               let json = String(data: data, encoding: String.Encoding.utf8)
//                //                                 print("Failure Response: \(json)")
//                //                              }
//                print("that is fail i n getting the getCategoriesList data Mate : \(response.result.error?.localizedDescription)")
//                //
//                completed( nil,  false )
//                break
//            }
//        }
//    }
//    
//    
//    func getUserProfile(  completed : @escaping ( UserProfile_Data?,Bool)->()) {
//        
//        let url = Constants.API.URLS_Get_Enum.User_Profile.stringValue()  
//        print("URL: is getUserProfile URL : \(url)")
//         Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
//            //            print(response.result)
//            switch(response.result) {
//            case .success(_):
//                guard response.result.error == nil, let value = response.result.value  else {
//                    
//                    // got an error in getting the data, need to handle it
//                    //                    print("error fetching data from url")
//                    //                    print(response.result.error?.localizedDescription)
//                    completed(nil  , false)
//                    
//                    return
//                    
//                }
//                let json = JSON( value) // SwiftyJSON
//                                print("that is  getMenuData getting the data Mate : %@", response.result.value)
//                let parm = Constants.API.Parameters()
//                let data = UserProfile_Data(json[parm.data])
//                print("that;s the data ;\(data.email) \(data)")
////                let status = json[parm.message].string != nil ? true : false
//                let sms = json[parm.message].string ?? json[parm.error][parm.message].stringValue
//                completed( data, true )
//                break
//                
//            case .failure(_) :
//                //                             if let data = response.data {
//                //                               let json = String(data: data, encoding: String.Encoding.utf8)
//                //                                 print("Failure Response: \(json)")
//                //                              }
//                print("that is fail i n getting the getUserProfile data Mate : \(response.result.error?.localizedDescription)")
//                //
//                completed( nil,  false )
//                break
//            }
//        }
//    }
}
