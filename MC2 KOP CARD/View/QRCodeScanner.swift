//
//  QRCodeScanner.swift
//  MC2 KOP CARD
//
//  Created by Amalia . on 03/07/22.
//

import SwiftUI
import CodeScanner

struct QRCodeScanner: View {
    
    @Binding var showQRScan: Bool
    @State private var isPresentingScanner = false
    @State private var scannedCode: String = "Scan a QR code to connect!"
    
    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
            }
        )
    }
    var body: some View {
        VStack(spacing: 10) {
            Text(scannedCode)
            Button("Scan QR Code") {
                self.isPresentingScanner = true
        }
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
    }
//struct QRCodeScanner_Previews: PreviewProvider {
//    static var previews: some View {
//        QRCodeScanner()
//    }
//}
}

