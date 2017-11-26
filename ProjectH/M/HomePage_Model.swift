//
//  HomePageM.swift
//  HyperApp
//
//  Created by Killvak on 26/12/2016.
//  Copyright © 2016 Killvak. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

private   let source = Constants.API.Parameters()


class HomePage_Model  {
    
    private var _id : Int?
    var categoryDetails : Category_Details?
    
    var id : Int {
        return   _id ?? 0
    }
    
    init(_ jsonData : JSON) {
        self._id = jsonData[source.id].intValue
        
    }
}


class Category_Details  {
    private  var _id_parent : Int?
    private var _imageUrl : String?
    private var _active : Int?
    private var _id : Int?
    private var _code : String?
    private var _name_ar :String?
    private var _name_en :String?
    
    
    
    var active : Bool {
        guard let x = _active , x == 1 else { return false }
        return true
    }
    var imageLink : String {
        guard let x = _imageUrl else { return "" }
        return Constants.API.URLS.IMAGE_URL +  x
    }
    
    var id : Int {
        return   _id ?? 0
    }
    var parent_Id : Int {
        return   _id_parent ?? 0
    }
    var code : String {
        return   _code ?? ""
    }
    
    var name : String {
        guard let x =  L102Language.currentAppleLanguage() == "en"  ? _name_en : _name_ar else { return "" }
        return x
    }
    //    var id = _id ?? 0
    
    
    
    
    init(_ jsonData : JSON) {
        self._id_parent = jsonData[source.id_parent].intValue
        self._id = jsonData[source.id].intValue
        self._imageUrl = jsonData[source.image].stringValue
        self._active = jsonData[source.active].intValue
        self._code = jsonData[source.code].stringValue
        self._name_ar = jsonData[source.nameAr].stringValue
        self._name_en = jsonData[source.name].stringValue
        
        
        
    }
}

class ProductDetails  {
    private  var _box_content_ar : String?
    private  var _box_content : String?
    private var _active : Int?

    private var _imageUrl : String?
    private var _id : Int?
    private var _code : String?
    private var _name_ar :String?
    private var _name_en :String?
    
    private var _quantity : Int?
    private var _main_material_ar : String?
    private var _main_material : String?
    private var _reduction_price : Int?

    
    
    var active : Bool {
        guard let x = _active , x == 1 else { return false }
        return true
    }
    var imageLink : String {
        guard let x = _imageUrl else { return "" }
        return Constants.API.URLS.IMAGE_URL +  x
    }
    
    var id : Int {
        return   _id ?? 0
    }
    var box_content  : String {
        guard let x =  L102Language.currentAppleLanguage() == "en"  ? _box_content : _box_content_ar else { return "" }
         return   x
    }
    var code : String {
        return   _code ?? ""
    }
    
    var name : String {
        guard let x =  L102Language.currentAppleLanguage() == "en"  ? _name_en : _name_ar else { return "" }
        return x
    }
    //    var id = _id ?? 0
    var quantity : Int {
        return   _quantity ?? 0
    }
    var mainMaterial : String {
        guard let x =  L102Language.currentAppleLanguage() == "en"  ? _main_material : _main_material_ar else { return "" }
        return x
    }
    var reduction_price : Int {
        return   _reduction_price ?? 0
    }
    init(_ jsonData : JSON) {
        self._box_content_ar = jsonData[source.box_content_ar].stringValue
        self._box_content = jsonData[source.box_content ].stringValue
        self._imageUrl = jsonData[source.main_image].stringValue
        self._quantity = jsonData[source.quantity].intValue
        self._id = jsonData[source.id].intValue
        self._active = jsonData[source.active].intValue
         self._code = jsonData[source.code].stringValue
        self._name_ar = jsonData[source.nameAr].stringValue
        self._name_en = jsonData[source.name].stringValue
        self._main_material = jsonData[source.main_material].stringValue
        self._main_material_ar = jsonData[source.main_material_ar].stringValue
        self._reduction_price = jsonData[source.reduction_price].intValue

 
    }
}

 /*
 
 class ProductDetails  {
 
 var id : Int?
 var name :String?
 var image_url : String?
 var image_pr :UIImage?
 var id_parent : Int?
 var level_depth : NSNumber?
 var price  : Double?
 var preDiscountPrice : NSNumber?
 var isFav : Bool?
 var onCart : Bool?
 var prDescription : String?
 var on_sale : Bool?
 var highlights : String?
 var id_main_category : Int?
 init(jsonData : JSON) {
 self.id = jsonData["id"].intValue
 self.name = jsonData["name"].stringValue
 self.image_url =  Constants.API.URLS.IMAGE_URL   + jsonData["main_image"].stringValue
 self.id_parent =  jsonData["id_category"].intValue
 self.price = jsonData["price"].doubleValue
 self.on_sale = jsonData["on_sale"].boolValue
 self.prDescription = jsonData["description"].stringValue
 self.highlights = jsonData["highlights"].stringValue
 self.id_main_category = jsonData["id_main_category"].intValue
 }
 init() {
 
 }
 }
 */


