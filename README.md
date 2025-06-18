//
//  README.md
//  devices-file-reader
//
//  Created by vvs on 18/06/25.
//

## Device file reader
Objetivo do projeto: utilizar o adb para reconhecer quais devices estao conectados ao dispositivo e listar seus arquivos.

Estrutura do projeto:
    .
    ├── BluetoothXPCService
    │   ├── BluetoothXPCService.entitlements
    │   ├── BluetoothXPCService.swift
    │   ├── BluetoothXPCServiceProtocol.swift
    │   ├── Info.plist
    │   └── main.swift
    ├── Core
    │   ├── Infrastructure
    │   │   ├── UsbProcessRunner.swift
    │   │   └── adb
    │   └── Protocols
    │       ├── UsbProtocol.swift
    │       └── UsbXPCProtocol.swift
    ├── DeviceReader
    │   ├── ContentView.swift
    │   ├── DeviceReader.entitlements
    │   ├── main.swift
    │   └── src
    │       └── Services
    │           └── UsbService.swift
    ├── README.md
    ├── UsbXPCService
    │   ├── Info.plist
    │   ├── UsbXPCDelegate.swift
    │   ├── UsbXPCFactory.swift
    │   ├── UsbXPCService.entitlements
    │   ├── UsbXPCService.swift
    │   └── main.swift
    └── devices-file-reader.xcodeproj
        ├── project.pbxproj
        ├── project.xcworkspace
        │   ├── contents.xcworkspacedata
        │   ├── xcshareddata
        │   │   └── swiftpm
        │   │       └── configuration
        │   └── xcuserdata
        │       └── vvs.xcuserdatad
        │           └── UserInterfaceState.xcuserstate
        └── xcuserdata
            └── vvs.xcuserdatad
                ├── xcdebugger
                │   └── Breakpoints_v2.xcbkptlist
                └── xcschemes
                    └── xcschememanagement.plist

## O que é preciso saber?

### XPC Service

### Android Command Line Tools

### adb - Android Debug Bridge

### Processos

### Threads

### Pipes
