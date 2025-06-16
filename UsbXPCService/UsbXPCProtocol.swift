//
//  UsbXPCProtocol.swift
//  devices-file-reader
//
//  Created by vvs on 16/06/25.
//

import Foundation

@objc(UsbXPCProtocol) public protocol UsbXPCProtocol {
    func readUsbDevices() throws -> [String]
    func readUsbDevice(_ devicePath: String) throws -> [String: Any]
}
