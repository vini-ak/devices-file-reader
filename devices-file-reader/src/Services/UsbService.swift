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
        self.conn = NSXPCConnection(serviceName: "test.UsbXPCService")
        
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
    func listDevices() throws -> [String] {
        guard let proxy = self.conn.remoteObjectProxy as? UsbXPCProtocol else {
            throw NSError(domain: "", code: 0, userInfo: nil)
        }
        
        do {
            return try proxy.readUsbDevices()
        } catch {
            self.disconnect()
            throw NSError(domain: "", code: 0, userInfo: nil)
        }
    }
}
