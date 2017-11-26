//
//  HomeVC.swift
//  ProjectH
//
//  Created by admin on 11/25/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import FSPagerView
import Alamofire
import AlamofireImage


class HomeVC: UIViewController {
     @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var brandsCollectionV: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var pagerController: FSPageControl!

    @IBOutlet weak var pagerView: FSPagerView!  {
        didSet {
            setUpPager()
        }
    }
    
    let getRequest = Get_Model_Requests()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        brandsCollectionV.delegate = self
        brandsCollectionV.dataSource = self
        categoriesCollectionView.register(CategoriesCV_Cell.nib, forCellWithReuseIdentifier: CategoriesCV_Cell.identifier)
        getRequest.getHomeData(2) { [weak self] (dataR, state) in
            guard   state else {
                
                return
            }
        }
    }

    
    
    func setUpPager() {
        self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        pagerView.isInfinite = true
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.automaticSlidingInterval = 4.5
        
//        pagerCont = FSPageControl(frame: self.pagerController.frame)
        
        pagerController.setStrokeColor(.red, for: .normal)
        pagerController.setStrokeColor(.white, for: .selected)
        pagerController.setFillColor(.red, for: .selected)
        pagerController.numberOfPages = self.imagelist.count
        if L102Language.currentAppleLanguage() == "ar" {
            pagerController.contentHorizontalAlignment = .left
        }else {
            pagerController.contentHorizontalAlignment = .right
        }
        pagerController.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
 
    }
 
      @IBOutlet weak var headerView: UIView!
 
    let imagelist = [UIImage(named:"0"),UIImage(named:"1"),UIImage(named:"2"),UIImage(named:"3"),UIImage(named:"4"),UIImage(named:"5")]


 
}


extension HomeVC :  UITableViewDelegate , UITableViewDataSource  {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageTableViewCell_ID", for: indexPath) as! HomePageTableViewCell
        
 
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
      
        return ad.mainRowCellSize!.height
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 658 // self.view.frame.height * 0.41 + 293.5
    }
}

extension HomeVC :  FSPagerViewDelegate,FSPagerViewDataSource {
    
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return  imagelist.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
            cell.imageView?.image = imagelist[index]
//        if let url = URL(string: "") {
//        let placeholderImage = UIImage(named: "PlaceHolder")!
//        cell.imageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
//        }
        return cell
    }
    
    //    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int){
    //        print("that's pcIndex \(pcIndex) pagerView \(pagerView.currentIndex) and targetIndex \(targetIndex)")
    //        self.pagerControllersViews?[pcIndex].backgroundColor = .gray
    //        self.pagerControllersViews?[targetIndex].backgroundColor = .white
    //    }
    
   
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        
//        guard let data = self.pagerData else {
//            //            print("Nil in pagerdata");
//            return   }
        
        guard self.pagerController.currentPage != pagerView.currentIndex else {
            return
        }
        if self.pagerController.currentPage != pagerView.currentIndex{
            
            self.pagerController.currentPage = pagerView.currentIndex
            
        }
        // Or Use KVO with property "currentIndex"
        //        self.fieldPagerLbl.text = self.textList[pagerView.currentIndex]
    }
 
 
 
    //    func pagerView(_ pagerView: FSPagerView, didEndDisplaying cell: FSPagerViewCell, forItemAt index: Int) {
    //
    //        self.pagerControllersViews?[index].backgroundColor = .gray
    //        self.pagerControllersViews?[pagerView.currentIndex].backgroundColor = .white
    //
    //      }
    
    func animateOutTableView(_ animationType: UIViewAnimationOptions) {
        self.tableView.scrollToTop()
        
        UIView.transition(with: tableView,
                          duration: 0.6,
                          options: animationType,
                          animations: {
                            self.tableView.reloadData()
                            //                             self.animateTableView()
        })
 
    }
    
    
    func animateTableView() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        //        let tableHeight = tableView.bounds.size.height
        //        let tableWidth = tableView.bounds.size.width
        
        for i in cells {
            let cell = i as UITableViewCell
            cell.transform = CGAffineTransform(scaleX: 0.3, y: 0.1).concatenating(CGAffineTransform(translationX: -800, y:0))
        }
        var index = 0
        
        for a in cells {
            let cell = a as UITableViewCell
            UIView.animate(withDuration: 1.4, delay: 0.05 * Double(index), usingSpringWithDamping: 0.73, initialSpringVelocity: 0, options: [.curveEaseOut,.allowUserInteraction], animations: {
                cell.transform = .identity
            })
            index += 1
        }
    }
    
}


