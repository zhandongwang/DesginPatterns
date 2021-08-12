//
//  ResponsibilityChain.swift
//  DesignPatterns
//
//  Created by 王战东 on 2020/6/30.
//  Copyright © 2020 王战东. All rights reserved.
//

//行为型(类或对象之间的交互)行为型--职责链模式

import Foundation

//数组方式实现
protocol IHandler {
    var handled:Bool {get set}
    
    func handle() ->Bool
}

class HandlerA: IHandler {
    var handled: Bool = false
    func handle() -> Bool {
        print("HandlerA handle");
        handled = true
        
        return handled
    }
}

class HandlerB: IHandler {
    var handled: Bool = false
    func handle() -> Bool {
        print("HandlerB handle");
        handled = true
        
        return handled
    }
}

class HandleChain {
    var handlers = [IHandler]()
    func add(handler:IHandler) {
        handlers.append(handler)
    }
    func handle() {
        for handler in handlers {
            if handler.handle() {
                //不再继续处理
                break;
            }
        }
    }
}


//链表方式实现
protocol PHandler {
    var successor:PHandler? {get set}
    func handle()
    func doHandle()
}

extension PHandler {
    //提供默认实现
    func handle() {
        doHandle()
        //继续执行
        if successor != nil {
            successor?.handle()
        }
    }
}


class PHandlerA: PHandler {
    var successor: PHandler?
    
    func doHandle() {
        print("PHandlerA handle")
    }
}

class PHandlerB: PHandler {
    var successor: PHandler?
    
    func doHandle() {
        print("PHandlerB handle")
    }
}

class PHandlerChain {
    var head:PHandler?
    var tail:PHandler?
    
    func add(handler:PHandler) {
        if head == nil {
            head = handler
            tail = handler
            return
        }
        tail?.successor = handler
        tail = handler
    }
    
    func handle() {
        if head != nil {
            head?.handle()
        }
    }
    
}
