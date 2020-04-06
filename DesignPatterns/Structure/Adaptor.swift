//
//  Adaptor.swift
//  DesignPatterns
//
//  Created by 王战东 on 2020/4/6.
//  Copyright © 2020 王战东. All rights reserved.
//

//结构型--适配器模式
import Foundation

protocol InterfaceTarget {
    func method1();
    func method2();
    func methodC();
}

class Adaptee {
    func methodA(){
        print("action A");
    }
    func methodB(){
        print("action B");
    }
    func methodC(){
        print("action C");
    }
}

//方式一：继承
class Adaptor: Adaptee, InterfaceTarget {
    func method1() {
        super.methodA();
        print("do another thing For A")
    }
    
    func method2() {
        print("重新实现methodB");
    }
    //methodC使用父类实现
}


class Adaptor2: InterfaceTarget {
    var adaptee:Adaptee;
    init(adaptee:Adaptee) {
        self.adaptee = adaptee;
    }
    
    func method1() {
        self.adaptee.methodA();
        print("do another thing For A")
    }
    
    func method2() {
        print("重新实现methodB");
    }
    
    func methodC() {
        self.adaptee.methodC();
    }
}
