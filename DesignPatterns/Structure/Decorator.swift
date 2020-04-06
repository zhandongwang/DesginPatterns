//
//  Decorator.swift
//  DesignPatterns
//
//  Created by 王战东 on 2020/4/5.
//  Copyright © 2020 王战东. All rights reserved.
//

//结构型--装饰器模式
import Foundation

protocol Car {
    func run();
}

class Toyota: Car {
    func run() {
        print("Toyota is Running")
    }
}

class WheelsDecorator: Car {
    var car:Car
    init(car:Car) {
        self.car = car;
    }
    
    func run() {
        print("add four wheels");
        car.run();
    }
}

class WindowsDecorator: Car {
    var car:Car
    init(car:Car) {
        self.car = car;
    }
    func run() {
        print("add six windows");
        car.run();
    }
}

class EngineDecorator: Car {
    var car:Car
    init(car:Car) {
        self.car = car;
    }
    func run() {
        print("add a Engine")
        car.run();
    }
    
}
