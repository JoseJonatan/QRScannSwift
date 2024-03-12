//
//  ContentView.swift
//  CodeScanningTest
//
//  Created by Jonatan Islas on 12/03/24.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    
    @State private var isPresentingScanner = false
        @State private var scannedCode = "Scan"

        var body: some View {
            VStack(spacing: 10) {
                Text(scannedCode)

                Button("Scan Code") {
                    isPresentingScanner = true
                }

                Text("Scan a QR code to get started")
            }
            .sheet(isPresented: $isPresentingScanner) {
                CodeScannerView(codeTypes: [.qr]) { response in
                    if case let .success(result) = response {
                        scannedCode = result.string
                        isPresentingScanner = false
                    }
                }
            }
        }
}

#Preview {
    ContentView()
}
