//
//  Bash.swift
//  ScriptyCore
//
//  Created by Ellen Shapiro on 11/13/18.
//

import Foundation
import Files

struct Bash {
    
    @discardableResult
    static func runShellCommand(launchPath: String = "/bin/sh",
                                arguments: [String],
                                verbose: Bool = false) -> String? {
        let task = Process()
        task.launchPath = launchPath
        task.arguments = arguments
        
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: String.Encoding.utf8)
        
        if verbose {
            print("""
                
                ====
                Launch Path: \(task.launchPath ?? "(No launch path)")
                Args:
                \t\((task.arguments ?? ["(none)"]).joined(separator: "\n\t"))
                Result:
                \(output ?? "(No output)")
                ====
                
                """)
        }
        
        return output
    }
}
