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
        testDecoratorPatter()
    }
    func testStrategyPattern() {
        FileSorter().sortFile(length: 9);
        FileSorter().sortFile(length: 99);
        FileSorter().sortFile(length: 999);
        FileSorter().sortFile(length: 99999);
    }
    
    func testProxyPattern() {
        let uc:IUserController = UserControllerProxy()
        let _:UserModel = uc.register(name:"张三", age: 30)
        _ = uc.login()
    }
    
    func testDecoratorPatter() {
        let car:Car = Toyota();
        let wheelsCar = WheelsDecorator(car: car)
        let windowsCar = WindowsDecorator(car:wheelsCar);
        let enginedCar = EngineDecorator(car:windowsCar);
        
        enginedCar.run();

    }
    
}

