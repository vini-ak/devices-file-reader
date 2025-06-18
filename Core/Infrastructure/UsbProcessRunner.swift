//
//  UsbProcessRunner.swift
//  devices-file-reader
//
//  Created by vvs on 18/06/25.
//
import Foundation

class UsbProcessRunner {
    var process: Process!
    
    init() {
        let adbUrl = Bundle.main.url(forResource: "adb", withExtension: nil)
        
        guard adbUrl != nil else {
            NSLog("adb binary not found")
            return
        }
        
        self.process = Process()
        self.process.executableURL = adbUrl
        self.process.arguments = ["shell", "ls", "sdcard/"]
    }
    
    func run(completion: @escaping ([String: [String]]) -> Void) {
        let pipe = Pipe()
        self.process.standardOutput = pipe

        self.process.terminationHandler = { process in
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            let output = String(decoding: data, as: UTF8.self)
            let lines = output.components(separatedBy: "\n").filter {
                line in !line.isEmpty
            }
            completion(["files": lines])
        }
        
        do {
            try self.process.run()
        } catch {
            let errorString = "\(error)"
            NSLog(errorString)
            completion(["message": [errorString]])
        }
    }
}
