//
//  ZXMainBarVC.swift
//  Control
//
//  Created by 赵庄鑫 on 2018/7/31.
//  Copyright © 2018年 paohon. All rights reserved.
//

import UIKit

enum TabBarType {
    case raceCenter
    case personCenter
}

class ZXMainBarVC: UITabBarController {
    
    var lineView : UIImageView!
    
    lazy var raceVC: ZXSwiftVC = {
        return ZXSwiftVC()
    }()
    
    lazy var personVC: ZXPersonVC = {
        return ZXPersonVC()
    }()

    
    
    weak var context:ZXNavigationVC? {
        get {
            return self.navigationController as? ZXNavigationVC
        }
    }
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createSubVC()
        // Do any additional setup after loading the view.
    }
    
    private func createSubVC() {
        let raceVC = self.raceVC
        let personVC = self.personVC;
        
        let raceItem = getTabBarItem(title: "竞赛", norImage: "alert_big_icon", selImage: "alert_big_icon", norColor: UIColor.lightGray, selColor: UIColor.blue)
        let centerItem = getTabBarItem(title: "个人", norImage: "alert_big_icon", selImage: "alert_big_icon", norColor: UIColor.lightGray, selColor: UIColor.blue)
        
        raceVC.tabBarItem = raceItem
        personVC.tabBarItem = centerItem
        
        tabBar.barTintColor = UIColor.white
        delegate = self as? UITabBarControllerDelegate
        
        setViewControllers([ZXNavigationVC.init(rootViewController: raceVC) ,
                            ZXNavigationVC.init(rootViewController: personVC)], animated: true)
        
        let shadowImage = UIImage.init(named: "green_button_n")
        
        lineView = UIImageView.init(frame: CGRect.init(x: 0, y: -10, width: UIScreen.main.bounds.size.width, height: 10))
        lineView.image = shadowImage
        
        tabBar.addSubview(lineView)
    }
    
    private func getTabBarItem(title:String,
                               norImage:String,
                               selImage:String,
                               norColor:UIColor,
                               selColor:UIColor) -> UITabBarItem {
        let tabBarItem = UITabBarItem.init(title: title,
                                           image: UIImage.init(named: norImage)?.withRenderingMode(.alwaysOriginal),
                                           selectedImage: UIImage.init(named: selImage)?.withRenderingMode(.alwaysOriginal))
        
        tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor :norColor], for: .normal)
        tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor :selColor], for: .selected)
        tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2)
        
        return tabBarItem
    }
    
    func switchToTab(type: TabBarType) {
        if type == .raceCenter {
            selectedIndex = 0
        }
        else if type == .personCenter {
            selectedIndex = 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
