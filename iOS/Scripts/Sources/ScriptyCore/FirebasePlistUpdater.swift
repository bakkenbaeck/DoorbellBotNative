//
//  FirebasePlistUpdater.swift
//  ScriptyCore
//
//  Created by Ellen Shapiro on 11/13/18.
//

import Foundation
import Files

struct FirebasePlistUpdater {

    private static let secretsFolderName = ".secrets"
    private static let secretsFileName = "ios_secrets.json"
    
    enum Error: Swift.Error {
        case couldNotAccessGitRoot
        case noSecretsFileOrSecrets(String)
    }
    
    static func run(sourceRoot: Folder) throws {
        guard let gitRoot = sourceRoot.parent else {
            throw Error.couldNotAccessGitRoot
        }
        
        let secrets: [String: String]
        if self.exportJSONExists(gitRoot: gitRoot) {
            print("Secrets file exists locally, loading from that...")
            secrets = try self.loadSecretsFromJSON(gitRoot: gitRoot)
        } else {
            print("No local secrets file, attempting to load from environment variables...")
            secrets = self.loadSecretsFromEnvironment()
            guard !secrets.isEmpty else {
                throw Error.noSecretsFileOrSecrets("You don't have a secrets file or secrets set up in the environment - this ain't gonna work. Please make sure to set up secrets in Circle CI." )
            }
        }
        
        try self.updateFirebasePlistValuesCommands(sourceRoot: sourceRoot, secrets: secrets)
    }
    
    private static func exportJSONExists(gitRoot: Folder) -> Bool {
        do {
            let secretsFolder = try gitRoot.subfolder(named: secretsFolderName)
            return secretsFolder.containsFile(named: secretsFileName)
        } catch {
            debugPrint("Error checking if export script exists: \(error)")
            return false
        }
    }
    
    private static func loadSecretsFromJSON(gitRoot: Folder) throws -> [String: String] {
        let secretsFolder = try gitRoot.subfolder(named: secretsFolderName)
        let iosFile = try secretsFolder.file(named: secretsFileName)
        
        return try JSONLoader.loadStringJSON(from: iosFile)
    }
    
    private static func loadSecretsFromEnvironment() -> [String: String] {
        let envDict = ProcessInfo.processInfo.environment
        
        return envDict.filter { key, _ in
            return key.hasPrefix("FIR_")
        }
    }
    
    private static func updateFirebasePlistValuesCommands(sourceRoot: Folder,
                                                          secrets: [String: String]) throws {
        
        let iOSAppFolder = try sourceRoot.subfolder(named: "DoorbellBotNative")
        let plistFile = try iOSAppFolder.file(named: "GoogleService-Info.plist")
        
        let keysToUpdate = [
            "AD_UNIT_ID_FOR_BANNER_TEST",
            "API_KEY",
            "CLIENT_ID",
            "DATABASE_URL",
            "GCM_SENDER_ID",
            "GOOGLE_APP_ID",
            "PROJECT_ID",
            "REVERSED_CLIENT_ID",
            "STORAGE_BUCKET"
        ]
        
        keysToUpdate.forEach { key in
            let secretKey = "FIR_\(key)"
            guard let secret = secrets[secretKey] else {
                print("No secret found for \(secretKey)")
                return
            }
            
            Plister.setValue(secret, for: key, in: plistFile)
        }
        
        Plister.save(file: plistFile)
    }
}
