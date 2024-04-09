//
//  DevLog.swift
//
//
//  Created by Lucas C Barros on 2024-04-08.
//

import Foundation

enum DevLog {
    enum LogLevel {
        case info
        case warning
        case error
        
        fileprivate var prefix: String {
            switch self {
            case .info: return "INFO ℹ️"
            case .warning: return "WARN ⚠️"
            case .error: return "ALERT ❌"
            }
        }
    }
    
    struct Context {
        let file: String
        let function: String
        let line: Int
        // The state the app was in before the error
        var description: String {
            return "\((file as NSString).lastPathComponent):\(line) \(function)"
        }
    }
    
    // #file is Literal Expression: Swift will substitute in runtime
    static func info(_ str: String, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        DevLog.handleLog(level: .info, str: str.description, shouldLogContext: shouldLogContext, context: context)
        
    }
    
    static func warning(_ str: String, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        DevLog.handleLog(level: .warning, str: str.description, shouldLogContext: shouldLogContext, context: context)
        
    }
    
    static func error(_ str: String, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        DevLog.handleLog(level: .error, str: str.description, shouldLogContext: shouldLogContext, context: context)
        
    }
    
    fileprivate static func handleLog(level: LogLevel, str: String, shouldLogContext: Bool, context: Context) {
        let logComponents = ["[\(level.prefix)] >>", str]
        
        var fullString = logComponents.joined(separator: " ")
        if shouldLogContext {
            fullString += " ➢ \(context.description)"
        }
        
        #if DEBUG
        print(fullString)
        #endif
    }
}
