//
//  UsbXPCDelegate.swift
//  devices-file-reader
//
//  Created by vvs on 16/06/25.
//
import Foundation

class UsbXPCDelegate: NSObject, NSXPCListenerDelegate {
    // private let serviceName = "com.vvs.usb-xpc-service"
    
    func listener(_ lisneter: NSXPCListener, shouldAcceptNewConnection connection: NSXPCConnection) -> Bool {        
        connection.exportedInterface = NSXPCInterface(with: UsbXPCProtocol.self)
        connection.exportedObject = UsbXPCFactory.create()
        
        connection.remoteObjectInterface = NSXPCInterface(with: UsbProtocol.self)
        
        (connection.exportedObject as? UsbXPCService)?.listener = connection.remoteObjectInterface as? UsbProtocol
        connection.resume()
        
        return true
    }
}
