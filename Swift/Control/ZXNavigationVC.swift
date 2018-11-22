//
//  ZXNavigationVC.swift
//  Control
//
//  Created by 赵庄鑫 on 2018/7/31.
//  Copyright © 2018年 paohon. All rights reserved.
//

import UIKit

class ZXNavigationVC: UINavigationController {
    
    
    //MARK: - Tool
    func pushViewController(withName:String ,data:Any? ,animated:Bool) {
        
        let controller:UIViewController? = {
            guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
                print("命名空间不存在")
                return nil
            }
            
            let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + withName)
            
            guard let clsType = cls as? UIViewController.Type else {
                return nil
            }
            
            let vc = clsType.init()
            return vc
        }()
        
        hidesBottomBarWhenPushed = true

        self.pushViewController(controller!, animated: true)
    }
    
    private func getController(withName:String ,data:Any?) -> UIViewController? {
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            print("命名空间不存在")
            return nil
        }
        
        let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + withName)
        
        guard let clsType = cls as? UIViewController.Type else {
            return nil
        }
        
        let vc = clsType.init()
        return vc
    }
    
    //MARK: - lifecycle
    convenience init(rootVC: ZXBaseVC ,data:AnyObject?) {
        self.init(rootViewController: rootVC)
    }
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    init(rootVC: UIViewController) {
        super.init(rootViewController: rootVC)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
