//
//  Constants.swift
//  Breeze-User
//
//  Created by admin on 11/1/17.
//  Copyright © 2017 CreativeMinds. All rights reserved.
//

import Foundation
import UIKit




  
class GLOBAL {
    
    static var USER_ID :String = {
        guard  let userID = UserDefaults.standard.value(forKey: "User_ID") as? String else {
            //        print("error fetching userId from NSUserD.userId")
            return "0"
        }
        return userID
    }()
    
    static func alamoRequest (query_url : String ) -> URLRequest {
        
        
        let urlAddressEscaped = query_url.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        
        
        //MARK: timeout after ... Sec
        let request = URLRequest(url: URL(string: urlAddressEscaped!)!, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 8)
        return  request
    }
    
    
}

extension UINavigationController {
    
    func setColor() {
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
}


//
//fileprivate var TOKEN  = "?token=\(UserDefaults.standard.value(forKey: "token") as? String ?? "")"

class Constants {
    
    // #54BD56   dark red
    // #54BD56   light green
    
    
//    class  var order_ID :Int {
//        guard let id = UserDefaults.standard.value(forKey: "orderID") as? Int else { return 0 }
//        return id
//    }
    static let  HEADER = ["Authorization": "627562626c6520617069206b6579"]

    
    class API {
        
        static let main_url = "http://hyper-testing.herokuapp.com/"
        
         enum URLS_Post_Enum {
            case MakeOrder
            case Search
            case AddPhone
            func stringValue() -> String {
                switch self {
                case .MakeOrder:
                    return API.main_url  + "makeOrder"
                case .Search:
                    return API.main_url  + "search"
                case .AddPhone:
                    return API.main_url  + "addPhone"
                }
            }
        }
        
        enum URLS_Get_Enum {
            case HomePage
            case GetItem
            case GetItemByCategory
            case SIGNUP_API
            case SIGN_IN
            case ITEM_REVIEW
            case AddReview
            case FBlogin
            case GoogleLogin
            case getOrdersByUser
            case GetProductImages
            case GetAllBrands
            case GetUser
            case GetItemByBrand
            case AddAddress
            case GetUserAddress
 
            func stringValue() -> String {
                switch self {
                case .HomePage: return API.main_url + "HomePage"
                case .GetItem : return API.main_url + "GetItem"
                case .GetItemByCategory : return API.main_url + "GetItemByCategory"
                case .SIGNUP_API : return API.main_url + "signup"
                case .SIGN_IN : return API.main_url + "login"
                case .ITEM_REVIEW : return API.main_url + "GetItemReview"
                case .AddReview : return API.main_url + "AddReview"

                case .FBlogin : return API.main_url + "FBlogin"
                case .GoogleLogin : return API.main_url + "GoogleLogin"
                case .getOrdersByUser : return API.main_url + "getOrdersByUser"
                case .GetProductImages : return API.main_url + "GetProductImages"
                case .GetAllBrands : return API.main_url + "GetAllBrands"
                case .GetUser : return API.main_url + "getUser"
                case .GetItemByBrand : return API.main_url + "GetItemByBrand"
                case .AddAddress : return API.main_url + "addAddress"
                case .GetUserAddress : return API.main_url + "getUserAddress"
 
                }
            }
        }
        
        
        class URLS {
            //            let API_TOKEN = "?api_token=776645543"
            //            let IMAGES_URL = "https://almala3b.com/"
            //           private  let HEADER_ID  = "X-Authorization-token"
            //           private  let HEADER_Value = "12b20fa6cca0ee113dc92d16f6be3029"
//            var HEADER : [String:String]  {
//                guard let auth = UserDefaults.standard.value(forKey: "Authorization") as? String else {
//                    return [:]
//
//                }
//                return ["Authorization" : "Basic \(auth)"]
//            }
            let SINGLE_HEADER = ["Content-Type":"application/json"]
           static let IMAGE_URL = "http://arafa.000webhostapp.com/Hyper/uploads/"
            
            //ARTICLES
            //            let POST_ARTICLES_DATA = API.main_url + "articles"
            //            let GET_ARTICLES_ALL = API.main_url + "articles"
            //            let GET_ARTICLES_DATA_BY_ID = API.main_url + "articles/"
            //////////////
            //User
            
        }
        
        class Parameters {
            let requestHasFailed = "Request has failed,Please check your network connection"
            //DiNames
            let user = "user"
            //Global
            let id = "id"
            let status_code = "status_code"
            let error = "error"
            let status = "status"
            let data = "data"
            let image = "image"
            let nameAr = "nameAr"
            let name = "name"
            let active = "active"
            let quantity = "quantity"
            let main_image = "main_image"
            let price = "price"
            //Register
             let first_name = "first_name"
            let last_name = "last_name"
            let email = "email"
            
            //category
            let category = "category"
            let id_parent = "id_parent"
            let code = "code"
            //Products
            let Products = "Products"
            let box_content_ar = "box_content_ar"
            let main_color = "main_color"
            let reduction_percent = "reduction_percent"
            let colors = "colors"
            let main_material_ar = "main_material_ar"
            let reduction_price = "reduction_price"
            let highlights = "highlights"
            let id_main_color = "id_main_color"
            let manufacturer = "manufacturer"
            let id_category = "id_category"
            let warranty = "warranty"
            let highlightsAr = "highlightsAr"
            let reduction_from = "reduction_from"
            let out_of_stock = "out_of_stock"
            let id_main_category = "id_main_category"
            let id_manufacturer = "id_manufacturer"
            let descriptionAr = "descriptionAr"
            let wholesale_price = "wholesale_price"
            let main_material = "main_material"
            let dimensions = "dimensions"
            let country = "country"
            let main_category_ar = "main_category_ar"
            let description = "description"
            let on_sale = "on_sale"
            let box_content = "box_content"
            let id_supplier = "id_supplier"
            let manufacturer_ar = "manufacturer_ar"
            let main_category = "main_category"
            let weight = "weight"
            let new_code = "new_code"
 
            
            
            
            
            
        }
        
    }
    
    
    
    
    
    
    
    
    
}
