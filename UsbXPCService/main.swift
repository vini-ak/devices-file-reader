//
//  main.swift
//  devices-file-reader
//
//  Created by vvs on 16/06/25.
//
import Foundation

let delegate = UsbXPCDelegate()
let listener = NSXPCListener.service()
listener.delegate = delegate
listener.resume()

