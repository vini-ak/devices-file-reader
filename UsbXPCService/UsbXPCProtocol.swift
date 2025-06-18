//
//  UsbXPCProtocol.swift
//  devices-file-reader
//
//  Created by vvs on 16/06/25.
//

import Foundation

@objc(UsbXPCProtocol) public protocol UsbXPCProtocol {
    func readUsbDevices(completion: @escaping ([String]) -> Void)
    func readUsbDevice(_ device: String, completion: @escaping (String?) -> Void)
}
