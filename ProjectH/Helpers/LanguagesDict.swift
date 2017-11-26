//
//  File.swift
//  Elmla3eb
//
//  Created by Macbook Pro on 6/8/17.
//  Copyright © 2017 Killvak. All rights reserved.
//

import Foundation

let isAraLang = {
    return  L102Language.currentAppleLanguage() == "ar"
    
}

  let ALERT = langDicClass().getLocalizedTitle("Something Went Wrong")
let langDicClass = {
    return  Constants.LanguagesDict()
}


extension Constants {
class LanguagesDict {
    // langDicClass().getLocalizedTitle(
    private  var dict  : [String:(eng:String,ara:String)] = [
        "User not found": ("Please check your Email or Password","من فضلك تفقد كلمه المرور والايميل"),
        "Request has failed,Please check your network connection" : ("Request has failed,Please check your network connection","خطأ في الاتصال"),
        "Something Went Wrong" : ("Something Went Wrong","حدث خطأ"),
        "Couldn't logout user,Please try again" : ("Couldn't logout user,Please try again","حدث خطأ, من فضلك حاول مره اخري"),
        "Password must contain at least 8 characters" : ("Password TextField must contain at least 8 characters","يجب ان تحتوي كلمه المرور اكثر من ٨ احرف"),
        "Password Doesn't Match" : ("Password Doesn't Match","كلمه المرور غير متطابقه"),
        "New password can't be the same as the old password" : ("New password can't be the same as the old password","كلمه المرور مطابقه لكلمه المرور الحاليه"),
        "Old Password Text" : ("Old Password Text",""),
        "New Password Text" : ("New Password Text",""),
        "Confirm Password Text" : ("Confirm Password Text",""),
    ]
    // langDicClass().getLocalizedTitle("Confirm")
    
    func getLocalizedTitle(_ title : String) -> String {
        guard let checkTitle = dict[title] else {
          return  title
         }
        guard L102Language.currentAppleLanguage() == "ar" else {
 //                print("that's the loclized value : \(arTitle)")
                return checkTitle.eng
            }
         return checkTitle.ara
    }
    
    
}
}
