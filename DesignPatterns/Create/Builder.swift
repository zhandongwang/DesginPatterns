//
//  Builder.swift
//  DesignPatterns
//
//  Created by 王战东 on 2020/4/30.
//  Copyright © 2020 王战东. All rights reserved.
//
//创建型（对象创建）--建造者模式
import Foundation

enum IllegalError:Error {
    case argumentError
    case unknownError
}

//MARK: - 构建者
class ResourseConfigBuilder {
    //MARK: - 冗余代码
    var name:String = ""
    var maxTotal:Int = 8
    var maxIdle:Int = 8
    var minIdle:Int = 0
    
    //MARK: - 判断属性依赖关系
    func build() throws -> ResourseConfig{
        guard !(name.isEmpty) else {
            throw IllegalError.argumentError
        }
        
        guard maxIdle < maxTotal else {
            throw IllegalError.argumentError
        }
        
        guard minIdle < maxIdle else {
            throw IllegalError.argumentError
        }
        return ResourseConfig.init(builder:self)
    }
    
    //MARK: - 设置属性
    func setName(name:String) throws -> ResourseConfigBuilder {
        guard !(name.isEmpty) else {
             throw IllegalError.argumentError
        }
        self.name = name
        return self
    }
    func setMaxTotal(maxTotal:Int) throws -> ResourseConfigBuilder{
        guard maxTotal > 0 else {
            throw IllegalError.argumentError
        }
        self.maxTotal = maxTotal
        return self
    }
    func setMaxIdle(maxIdle:Int) throws -> ResourseConfigBuilder {
        guard maxIdle > 0 else {
            throw IllegalError.argumentError
        }
        self.maxIdle = maxIdle
        return self
    }
    
    func setMinIdel(minIdel:Int) throws -> ResourseConfigBuilder{
        guard minIdel > 0 else {
            throw IllegalError.argumentError
        }
        self.minIdle = minIdel
        return self
    }
}


class ResourseConfig {
    var name:String
    var maxTotal:Int
    var maxIdle:Int
    var minIdle:Int
    
    init(builder:ResourseConfigBuilder){
        name = builder.name
        maxTotal =  builder.maxTotal
        maxIdle = builder.maxIdle
        minIdle = builder.minIdle
    }
}
