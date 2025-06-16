//
//  UsbXPCService.swift
//  devices-file-reader
//
//  Created by vvs on 16/06/25.
//

import Foundation

class UsbXPCService: NSObject, UsbXPCProtocol {
    var listener: UsbProtocol?
    
    func readUsbDevices() throws -> [String] {
        print("to implement")
        return ["device1"]
    }
    
    func readUsbDevice(_ devicePath: String) throws -> [String : Any] {
        print("to implement")
        return [:]
    }
}
