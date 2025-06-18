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
    
    public func run() async {
        do {
            let devices = try await usbReader.listDevices()
            print(devices)
        } catch {
            print("Error: \(error)")
        }
    }
}

let app = App()

Task {
    await app.run()
    exit(EXIT_SUCCESS)
}

dispatchMain()
