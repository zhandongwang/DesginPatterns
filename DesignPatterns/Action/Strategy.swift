//
//  Strategy.swift
//  DesignPatterns
//
//  Created by 王战东 on 2020/4/5.
//  Copyright © 2020 王战东. All rights reserved.
//

//行为型(类或对象之间的交互)--策略模式

import Foundation

protocol SortAlg {
    func sort();
}

class QuickSort:SortAlg {
    func sort() {
        print("QuickSort")
    }
}

class ExternalSort:SortAlg {
    func sort() {
        print("ExternalSort")
    }
}

class ConcurrentExternalSort:SortAlg {
    func sort() {
        print("ConcurrentExternalSort")
    }
}

class MapReducedSort:SortAlg {
    func sort() {
        print("MapReducedSort")
    }
}

class SortAlgFactory {
    var algs = [String:SortAlg]();
    init() {
        algs["QuickSort"] = QuickSort();
        algs["ExternalSort"] = ExternalSort();
        algs["ConcurrentExternalSort"] = ConcurrentExternalSort();
        algs["MapReducedSort"] = MapReducedSort();
    }
    
    func getAlg(type:String) -> SortAlg? {
        return algs[type];
    }
}

class FileSorter {
    func sortFile(length fileLength:Float) {
        if fileLength < 10 {
            SortAlgFactory().getAlg(type: "QuickSort")?.sort();
        } else if fileLength < 100 {
            SortAlgFactory().getAlg(type: "ExternalSort")?.sort();
        } else if fileLength < 1000 {
            SortAlgFactory().getAlg(type: "ConcurrentExternalSort")?.sort();
        } else {
            SortAlgFactory().getAlg(type: "MapReducedSort")?.sort();
        }
    }
}
