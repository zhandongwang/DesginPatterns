//
//  Proxy.swift
//  DesignPatterns
//
//  Created by 王战东 on 2020/4/5.
//  Copyright © 2020 王战东. All rights reserved.
//

//结构型（类或对象的组合）--代理模式
import Foundation

struct UserModel {
    var name:String;
    var age:Float;
}

class MetricsCollector {
    func startCaculateTime() {
        print("startCaculateTime");
    }
    
    func endCaculateTime() {
        print("endCaculateTime");
    }
    
    func recordRequest(){
        print("recording request");
    }
}

protocol IUserController {
    var name:String{get set};
    var age: Float { get set };
    
    func login()->Bool;
    func register(name:String, age:Float)->UserModel;
}

class UserController:IUserController{
    var name: String = ""
    
    var age: Float = 0.0
    
    func login()-> Bool{
        print("\(name) doing login...");
        
        return true;
    }
    
    func register(name:String, age:Float)->UserModel {
        self.name = name;
        self.age = age;
        print("\(name) doging register");
        
        return UserModel(name:self.name, age: self.age);
    }
}

//方式一：继承
class UserControllerProxy: UserController {
    let metricsCollector:MetricsCollector;
    override init() {
        metricsCollector = MetricsCollector();
    }
    
    override func login() -> Bool {
        metricsCollector.startCaculateTime();
               
        let result = super.login();
               
        metricsCollector.endCaculateTime();
        metricsCollector.recordRequest();
               
        return result;
    }
    
    override func register(name: String, age: Float) -> UserModel {
        metricsCollector.startCaculateTime();
        
        let model = super.register(name: name, age: age);
        
        metricsCollector.endCaculateTime();
        metricsCollector.recordRequest();
        
        return model;
    }
}

//方式一：接口
//class UserControllerProxy:IUserController {
//    var name: String = ""
//
//    var age: Float = 0.0
//
//    let userController:UserController;
//    let metricsCollector:MetricsCollector;
//
//    init(uc:UserController) {
//        userController = uc;
//        metricsCollector = MetricsCollector.init();
//    }
//
//    func login() -> Bool{
//        metricsCollector.startCaculateTime();
//
//        let result:Bool = userController.login();
//
//        metricsCollector.endCaculateTime();
//        metricsCollector.recordRequest();
//
//        return result;
//    }
//
//    func register(name:String, age:Float) -> UserModel {
//        metricsCollector.startCaculateTime();
//
//        let model = userController.register(name: name, age: age);
//
//        metricsCollector.endCaculateTime();
//        metricsCollector.recordRequest();
//
//        return model
//    }
//}


