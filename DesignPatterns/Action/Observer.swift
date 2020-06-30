//
//  Observer.swift
//  DesignPatterns
//
//  Created by 王战东 on 2020/4/30.
//  Copyright © 2020 王战东. All rights reserved.
//
//行为型(类或对象之间的交互)--观察者模式

import Foundation

protocol Subject {
    func registerObsever(obsever:Observer);
    func removeObsever(obsever:Observer);
    func notifyObsever(msg:String);
}

protocol Observer {
    var name:String { get set
    };
    
    func update(msg:String);
}

class ConcreteSubject: Subject {
    var observers = [Observer]();
    
    func registerObsever(obsever: Observer) {
        observers.append(obsever);
    }
    
    func removeObsever(obsever observer: Observer) {
        let index:Int? = observers.firstIndex{
            $0.name == observer.name;
        }
        if let i = index {
            observers.remove(at: i);
            print("\(observer.name) is removed");
        }
    }
    
    func notifyObsever(msg: String) {
        for observer in observers {
            observer.update(msg: msg);
        }
    }
    
}

class ConcreteObserverOne: Observer {
    var name: String
    
    init(){
        name = "ConcreteObserverOne";
    }
    
    func update(msg: String) {
        print("ConcreteObserverOne is notified with \(msg)");
    }
}

class ConcreteObserverTwo: Observer {
    var name: String
    init() {
        name = "ConcreteObserverTwo";
    }
    
    func update(msg: String) {
        print("ConcreteObserverTwo is notified with \(msg)");
    }
    
    
}
