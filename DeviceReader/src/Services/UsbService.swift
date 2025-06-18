//
//  Untitled.swift
//  devices-file-reader
//
//  Created by vvs on 16/06/25.
//
import Foundation

class UsbService {
    private var conn: NSXPCConnection!
    
    init() {
        self.connect()
    }
    
    deinit {
        self.disconnect()
    }
    
    private func connect() {
        self.conn = NSXPCConnection(serviceName: "br.org.cesar.UsbXPCService")
        
        self.conn.remoteObjectInterface = NSXPCInterface(with: UsbXPCProtocol.self)
        
        self.conn.exportedObject = self
        self.conn.exportedInterface = NSXPCInterface(with: UsbProtocol.self)
        
        self.conn.interruptionHandler = {
            NSLog("Interupted connection")
            self.conn = nil
        }
        
        self.conn.resume()
    }
    
    func disconnect() {
        guard self.conn == nil else {
            NSLog("Already disconnected")
            return
        }
        
        self.conn.invalidate()
    }
}

extension UsbService: UsbProtocol {
    func listDevices() async throws -> [String] {
        guard self.conn != nil else {
            throw NSError(domain: "usb-error", code: 1, userInfo: nil)
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            guard let xpc = self.conn?.remoteObjectProxyWithErrorHandler({
                error in
                    continuation.resume(throwing: error)
                }) as? UsbXPCProtocol else {
                    continuation.resume(throwing: NSError(domain: "usb-error", code: 1))
                    return
                }

//                xpc.readUsbDevices { devices in
//                    continuation.resume(returning: devices)
//                }
            xpc.readUsbDevice("Teste") {
                devices in print(devices)
            }
        }
    }
}
