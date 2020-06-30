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
        testObserverPattern()
    }

    func testObserverPattern() {
        let subject = ConcreteSubject();
        let observer1 = ConcreteObserverOne();
        let observer2 = ConcreteObserverTwo();
        subject.registerObsever(obsever: observer1);
        subject.notifyObsever(msg: "hello");
        subject.removeObsever(obsever: observer1);
        
        subject.registerObsever(obsever: observer2);
        subject.notifyObsever(msg: "hello");
        subject.removeObsever(obsever: observer2);
        
    }
    
    func testFactoryPattern() {
        FileParserFactory().creatParser(name: "json")?.parse(filePath: "hello")
        FileParserFactory().creatParser(name: "xml")?.parse(filePath: "world")
        FileParserFactory().creatParser(name: "properties")?.parse(filePath: "hangzhou")
        
    }
    
    func testBuilderPattern() {
        let config = try? ResourseConfigBuilder.init().setName(name:"test").setMaxTotal(maxTotal: 1000).setMaxIdle(maxIdle: 100).setMinIdel(minIdel: 10).build()
//        do {
//            config = try ResourseConfigBuilder.init().setName(name:"test").setMaxTotal(maxTotal: 1000).setMaxIdle(maxIdle: 10000).setMinIdel(minIdel: 10).build()
//        } catch IllegalError.argumentError {
//            config = nil;
//        } catch {
//            config = nil;
//        }
        print(config?.name)
    }
    
    func testStrategyPattern() {
        FileSorter().sortFile(length: 9);
        FileSorter().sortFile(length: 99);
        FileSorter().sortFile(length: 999);
        FileSorter().sortFile(length: 99999);
    }
    
    func testBridgePatter() {
        SeverNotification.init(msgSender: TelMsgSender()).notify(message: "严重警告")
        SeverNotification.init(msgSender: WechatMsgSender()).notify(message: "严重警告")
        NormalNotification.init(msgSender: WechatMsgSender()).notify(message: "普通警告")
        UrgencyNotification.init(msgSender: EmailMsgSender()).notify(message: "紧急警告");
        
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

