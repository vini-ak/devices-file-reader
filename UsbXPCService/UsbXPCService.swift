//
//  UsbXPCService.swift
//  UsbXPCService
//
//  Created by vvs on 17/06/25.
//

import Foundation

/// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
class UsbXPCService: NSObject, UsbXPCProtocol {
    var listener: UsbProtocol?
    let process: UsbProcessRunner!
    
    init(process: UsbProcessRunner!) {
        self.process = process
    }
    /// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
    func readUsbDevices(completion: @escaping ([String]) -> Void) {
            // Código que lê os dispositivos USB
            let devices = ["Device1", "Device2"]
            completion(devices)
        }
    
    func readUsbDevice(_ device: String, completion: @escaping ([String: [String]]) -> Void) {
        self.process.run {
            output in print(output)
            completion(output)
        }
    }
    
}
