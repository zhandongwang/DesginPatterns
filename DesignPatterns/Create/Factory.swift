//
//  Factory.swift
//  DesignPatterns
//
//  Created by 王战东 on 2020/4/5.
//  Copyright © 2020 王战东. All rights reserved.
//

//创建型（对象创建）--工厂模式
import Foundation

protocol FileParse {
    func parse(filePath:String);
}

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
