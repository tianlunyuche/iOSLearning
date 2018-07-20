//
//  ZXSwiftVC.swift
//  Control
//
//  Created by 赵庄鑫 on 2018/4/8.
//  Copyright © 2018年 paohon. All rights reserved.
//

import UIKit
//, UITableViewDelegate, UITableViewDataSource
class ZXSwiftVC: UIViewController{
    
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("你好呀%d", 2)
        NSLog("大家好", "hi")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() -> Void {
        view.addSubview(tableView)
        tableView.frame = view.bounds
//        tableView.dataSource = self
//        tableView.delegate = self
    }

    //MARK: - <#UITableViewDataSource#>
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
