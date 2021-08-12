//
//  Mediator.swift
//  DesignPatterns
//
//  Created by 王战东 on 2021/6/3.
//  Copyright © 2021 王战东. All rights reserved.
//

//行为型(类或对象之间的交互)--中介者模式
//将一组对象之间的交互关系（或依赖关系）从多对多（网状关系）转换为一对多（星状关系）
import Foundation
import UIKit

protocol Mediator {
    func handle(component:UIControl, event:String)
}

class LoginDialog:Mediator {
    var loginButton:UIButton?
    var regButton:UIButton?
    var userNameTextField:UITextField?
    var passwordTextField:UITextField?
    
    func handle(component: UIControl, event: String) {
        if component == loginButton {
            
        } else if component == regButton {
            
        } else if component == userNameTextField {
            
        } else if component == passwordTextField {
            
        }
    }
    
}
