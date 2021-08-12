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
        testVisitor()
    }
    
    func testVisitor() {
        let resourceFiles:[ResourceFile] = [PdfFile(filePath:"a.pdf"),PPTFile(filePath: "b.ppt"),WordFile(filePath: "c.word")]
        for rs in resourceFiles {
            rs.accept(visitor: Extractor())
        }
        
        for rs in resourceFiles {
            rs.accept(visitor: Compressor())
        }
        
    }

    func testResponsibilityChain() {
        let oneProcessChain = HandleChain()
        oneProcessChain.add(handler: HandlerA())
        oneProcessChain.add(handler: HandlerB())
        oneProcessChain.handle()
        
        let allProcessChain = PHandlerChain()
        allProcessChain.add(handler: PHandlerA())
        allProcessChain.add(handler: PHandlerB())
        allProcessChain.handle()
        
        
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
//        FileParserFactory().creatParser(name: "json")?.parse(filePath: "hello")
//        FileParserFactory().creatParser(name: "xml")?.parse(filePath: "world")
//        FileParserFactory().creatParser(name: "properties")?.parse(filePath: "hangzhou")
        RuleConfigParserFactoryMap().getPaserFactory(type: "json")?.createFilePaser().parse(filePath: "beijing");
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

        
        let adp_2 = Adaptor2(adaptee: ori);
        adp_2.method1();
        adp_2.method2();
        adp_2.methodC();

    }
    
    var loginDialog:LoginDialog = LoginDialog.init()
    func testMediatorPattern() {
        let loginButton:UIButton = UIButton.init()
        let regButton:UIButton = UIButton.init()
        let userNameTextField:UITextField = UITextField.init()
        let passwordTextField:UITextField = UITextField.init()
        
        loginDialog.loginButton = loginButton
        loginDialog.regButton = regButton
        loginDialog.userNameTextField = userNameTextField
        loginDialog.passwordTextField = passwordTextField
        
        loginButton.addTarget(self, action: #selector(login(button:)), for: .touchUpInside)
        
    }
    
    @objc func login(button:UIButton) {
        loginDialog.handle(component: button, event: "login")
    }
    
}

