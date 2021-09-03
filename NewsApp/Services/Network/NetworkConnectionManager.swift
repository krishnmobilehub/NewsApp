//
//  NetworkConnectionManager.swift
//  NewsApp
//


import Foundation
import Network

//For monitoring the network connection

class NetworkConnectionManager {

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global(qos: .background)
    var connected = false
    static let shared = NetworkConnectionManager()
    
    var isNetworkAvailable: Bool {
        return connected
    }
    
    private func updateStatus() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let strongSelf = self else {
                return
            }
            if path.status == .satisfied {
                strongSelf.connected = true
                print("We're connected!")
            } else {
                strongSelf.connected = false
                print("No connection.")
            }
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .networkStatusChange, object: nil)
            }
        }
    }
    
    func cancelMonitoring() {
        monitor.cancel()
    }
    
    func startMonitoring() {
        if monitor.queue == nil {
            monitor.start(queue: queue)
        }
        updateStatus()
    }
    
}



