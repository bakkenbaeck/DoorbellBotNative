//
//  Plister.swift
//  Files
//
//  Created by Ellen Shapiro on 11/13/18.
//

import Foundation
import Files

enum PlistError: Error {
    case noEnvValueForKey(String)
}

class Plister {
    
    private static func runPlistBuddyCommand(_ command: String, for file: File) {
        var args = ["-c"]
        
        args.append(command)
        args.append(file.path)
        
        Bash.runShellCommand(launchPath: "/usr/libexec/Plistbuddy",
                             arguments: args)
    }
    
    public static func setValue(_ value: String, for key: String, in file: File) {
        self.runPlistBuddyCommand("Set :\(key) \(value)", for: file)
    }
    
    public static func save(file: File) {
        self.runPlistBuddyCommand("Save", for: file)
    }
}
