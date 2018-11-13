import Foundation
import Files

public class Scripty {
    
    public static func run(with arguments: [String] = CommandLine.arguments) throws {
        debugPrint("Arguments: \(arguments)")
        
        let sourceRoot: Folder
        if let sourceRootPath = ArgParser.value(for: "src", in: arguments)   {
            sourceRoot = try Folder(path: sourceRootPath)
        } else {
            print("Source argument not provided, trying $SRCROOT environment variable")
            sourceRoot = try File.sourceRoot()
        }
        
        try FirebasePlistUpdater.run(sourceRoot: sourceRoot)
    }
}
