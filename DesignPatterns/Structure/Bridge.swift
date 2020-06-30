//
//  Bridge.swift
//  DesignPatterns
//
//  Created by 王战东 on 2020/4/30.
//  Copyright © 2020 王战东. All rights reserved.
//

//结构型（类或对象的组合）--桥接模式
import Foundation

//MARK: - 发送者接口

protocol MsgSender {
    func send(message:String)
}

//MARK: - 发送者接口实现类

class TelMsgSender: MsgSender {
    func send(message: String) {
        print("TelMsgSender " + message);
    }
}

class EmailMsgSender: MsgSender {
    func send(message: String) {
        print("EmailMsgSender " + message);
    }
}

class WechatMsgSender: MsgSender {
    func send(message: String) {
        print("WechatMsgSender " + message);
    }
}


//MARK: - 通知接口
protocol Notification {
    var msgSender:MsgSender { get set }
    func notify(message:String)
}

//MARK: - 通知接口实现类
class SeverNotification: Notification {
    var msgSender: MsgSender
    
    init(msgSender:MsgSender) {
        self.msgSender = msgSender;
    }
    
    func notify(message: String) {
        msgSender.send(message:"SeverNotify" + message)
    }
    
}

class UrgencyNotification: Notification {
    var msgSender: MsgSender
    
    init(msgSender:MsgSender) {
        self.msgSender = msgSender;
    }
    
    func notify(message: String) {
        msgSender.send(message:"UrgencyNotify" + message)
    }
    
}

class NormalNotification: Notification {
    var msgSender: MsgSender
    
    init(msgSender:MsgSender) {
        self.msgSender = msgSender;
    }
    
    func notify(message: String) {
        msgSender.send(message:"NormalNotify" + message)
    }
    
}

