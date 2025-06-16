//
//  main.swift
//  devices-file-reader
//
//  Created by vvs on 16/06/25.
//

import Foundation
import IOKit

class App {
    private let usbReader: UsbService
    
    init() {
        self.usbReader = UsbService()
    }
    
    deinit {
        usbReader.disconnect()
    }
    
    public func run() {
        do {
            let devices = try usbReader.listDevices()
            print(devices)
        } catch {
            print("Error: \(error)")
        }
    }
}

let app = App()
app.run()
