//
//  UsbXPCFactory.swift
//  devices-file-reader
//
//  Created by vvs on 18/06/25.
//

class UsbXPCFactory {
    static func create() -> UsbXPCProtocol {
        let process = UsbProcessRunner()
        return UsbXPCService(process: process)
    }
}
