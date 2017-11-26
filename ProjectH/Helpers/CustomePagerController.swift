//
//  CustomePagerController.swift
//  Breeze-User
//
//  Created by admin on 11/7/17.
//  Copyright © 2017 CreativeMinds. All rights reserved.
//

import Foundation
import UIKit

public protocol CustomPagerController  {

func setUpPagerCount(_ stackView : UIStackView,_ numberOfItems : Int) -> [UIView]
}

extension CustomPagerController  where Self: UIViewController  {
    
    func setUpPagerCount(_ stackView : UIStackView,_ numberOfItems : Int) -> [UIView]{
        print("wowow")
        var views : [UIView] = []
        for i in 0..<numberOfItems  {
            let view = UIView()
            view.backgroundColor = i == 0 ?  .white:.gray
            view.tag = i
           stackView.addArrangedSubview(view)
            views.append(view)
        }
        return views
    }
    
    func callCustomer(_ phoneNum : String?) {
        guard phoneNum != "" else {
            self.view.showSimpleAlert("Sorry", "Couldn't find the Client Phone Number", .error)
            return
        }
        print("that's the phone Number : \(phoneNum)")
        guard let pNum = phoneNum else { return }
        guard  let phoneCallURL:URL = URL(string: "tel:\(pNum)") else {
            self.view.showSimpleAlert("Sorry", "Couldn't find the Client Phone Number", .error)
            return
        }
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
            let alertController = UIAlertController(title: "Hey There", message: "Are you sure you want to call \n\(pNum)?", preferredStyle: .alert)
            let yesPressed = UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                application.openURL(phoneCallURL)
            })
            let noPressed = UIAlertAction(title: "No", style: .default, handler: { (action) in
                
            })
            alertController.addAction(yesPressed)
            alertController.addAction(noPressed)
            present(alertController, animated: true, completion: nil)
        }
        
    }

} 



