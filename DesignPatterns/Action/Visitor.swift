//
//  Visitor.swift
//  DesignPatterns
//
//  Created by 王战东 on 2021/1/12.
//  Copyright © 2021 王战东. All rights reserved.
//

//访问者模式:允许一个或多个操作应用到一组对象上。解耦操作和对象
import Foundation

//MARK: - 操作
protocol Visitor {
    func visit(pdfFile:PdfFile)
    func visit(pptFile:PPTFile)
    func visit(wordFile:WordFile)
}

class Compressor: Visitor {
    func visit(pdfFile: PdfFile) {
        print("pdfFile compress")
    }
    
    func visit(pptFile: PPTFile) {
        print("pptFile compress")
    }
    
    func visit(wordFile: WordFile) {
        print("wordFile compress")
    }
}

class Extractor: Visitor {
    func visit(pdfFile: PdfFile) {
        print("pdfFile extract")
    }
    
    func visit(pptFile: PPTFile) {
        print("pptFile extract")
    }
    
    func visit(wordFile: WordFile) {
        print("wordFile extract")
    }
}

//其他操作

//MARK: - 对象
protocol ResourceFile {
    var filePath:String { get set }
    func accept(visitor:Visitor);
}


class PdfFile:ResourceFile {
    var filePath: String
    
    init(filePath:String) {
        self.filePath = filePath
    }
    func accept(visitor:Visitor) {
        visitor.visit(pdfFile: self)
    }
}

class PPTFile: ResourceFile {
    var filePath: String
    
    init(filePath:String) {
        self.filePath = filePath
    }
    
    func accept(visitor:Visitor) {
        visitor.visit(pptFile: self)
    }
}

class WordFile: ResourceFile {
    var filePath: String
    
    init(filePath:String) {
        self.filePath = filePath
    }
    
    func accept(visitor:Visitor) {
        visitor.visit(wordFile: self)
    }
}
