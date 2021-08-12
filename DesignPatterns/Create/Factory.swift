//
//  Factory.swift
//  DesignPatterns
//
//  Created by 王战东 on 2020/4/5.
//  Copyright © 2020 王战东. All rights reserved.
//

//创建型（对象创建）--工厂模式
import Foundation

//MARK:接口定义
protocol FileParse {
    func parse(filePath:String);
}

//MARK:简单工厂
class FileParserFactory {
    let cachedParsers:[String:FileParse] =
        ["json":JsonFileParser(),
        "xml":XmlFileParser(),
        "properties":PropertiesFileParser()
        ]
    
    func creatParser(name:String) -> FileParse? {
        guard !name.isEmpty else {
            return nil
        }
        return cachedParsers[name]
    }
}


class JsonFileParser: FileParse {
    func parse(filePath: String) {
        print("this is a json file with name " + filePath)
    }
}

class XmlFileParser: FileParse {
    func parse(filePath: String) {
        print("this is a XML file with name " + filePath)
    }
}

class PropertiesFileParser: FileParse {
    func parse(filePath: String) {
        print("this is a Properties file with name " + filePath)
    }
}


//MARK:工厂方法
protocol IRuleConfigParserFactory {
    func createFilePaser() -> FileParse
}

class JsonRuleConfigParserFactory: IRuleConfigParserFactory {
    func createFilePaser() -> FileParse {
        return JsonFileParser()
    }
}

class XmlRuleConfigParserFactory: IRuleConfigParserFactory {
    func createFilePaser() -> FileParse {
        return XmlFileParser()
    }
}

class PropertiesRuleConfigParserFactory: IRuleConfigParserFactory {
    func createFilePaser() -> FileParse {
        return PropertiesFileParser()
    }
}
//MARK:工厂的工厂
class RuleConfigParserFactoryMap {
    let cachedFactories:[String:IRuleConfigParserFactory] = [
        "json":JsonRuleConfigParserFactory(),
        "xml":XmlRuleConfigParserFactory(),
        "properties":PropertiesRuleConfigParserFactory()
    ]
    
    func getPaserFactory(type:String) -> IRuleConfigParserFactory? {
        if type.isEmpty {
           return nil
        }
        return cachedFactories[type]
    }
}
