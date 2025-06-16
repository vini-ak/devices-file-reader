//
//  UsbProtocol.swift
//  devices-file-reader
//
//  Created by vvs on 16/06/25.
//

import Foundation

@objc(UsbProtocol) public protocol UsbProtocol {
    func listDevices() throws -> [String]
}
