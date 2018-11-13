//
//  ArgParser.swift
//  ScriptyCore
//
//  Created by Ellen Shapiro on 11/13/18.
//

import Foundation

struct ArgParser {
    
    static func convertToDictionary(_ args: [String]) -> [String: String] {
        var dict = [String: String]()
        args.forEach { arg in
            guard arg.contains("=") else {
                return
            }
            
            let split = arg.components(separatedBy: "=")
            guard
                split.count == 2,
                let key = split.first,
                let value = split.last else {
                    return
            }
            
            dict[key] = value
        }
        
        return dict
    }
    
    static func value(for key: String, in args: [String]) -> String? {
        let dict = self.convertToDictionary(args)
        return dict[key]
    }
    
}
