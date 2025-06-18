//
//  main.swift
//  UsbXPCService
//
//  Created by vvs on 17/06/25.
//

import Foundation
print("teste")
// Create the delegate for the service.
let delegate = UsbXPCDelegate()

// Set up the one NSXPCListener for this service. It will handle all incoming connections.
let listener = NSXPCListener.service()
listener.delegate = delegate

print("servico iniciado")
// Resuming the serviceListener starts this service. This method does not return.
listener.resume()
