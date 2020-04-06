//
//  ViewController.swift
//  DesignPatterns
//
//  Created by 王战东 on 2020/4/5.
//  Copyright © 2020 王战东. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        FileSorter().sortFile(length: 9);
//        FileSorter().sortFile(length: 99);
//        FileSorter().sortFile(length: 999);
//        FileSorter().sortFile(length: 99999);
        
        let uc:IUserController = UserControllerProxy()
        let _:UserModel = uc.register(name:"张三", age: 30)
        _ = uc.login()
    }
}

