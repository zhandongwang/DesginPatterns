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
        testAdaptorPattern()
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
    
    func testDecoratorPattern() {
        let car:Car = Toyota();
        let wheelsCar = WheelsDecorator(car: car)
        let windowsCar = WindowsDecorator(car:wheelsCar);
        let enginedCar = EngineDecorator(car:windowsCar);
        
        enginedCar.run();

    }
    func testAdaptorPattern() {
        let ori = Adaptee();
        ori.methodA();
        ori.methodB();
        ori.methodC();
        
        
//        var adp_1 = Adaptor()
//        adp_1.method1();
//        adp_1.method2();
//        adp_1.methodC();
        
        let adp_2 = Adaptor2(adaptee: ori);
        adp_2.method1();
        adp_2.method2();
        adp_2.methodC();

    }
    
}

