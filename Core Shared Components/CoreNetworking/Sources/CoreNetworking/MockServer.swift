//
//  MockServer.swift
//
//
//  Created on 21/09/2024.
//

import Foundation

public final class MockServer {
    public static func loadLocalJSON(
        _ fileName: String,
        fromBundle bundle: Bundle
    ) -> Data {
        guard let filePath = bundle.path(forResource: fileName, ofType: "json") else {
            fatalError("Mock data was not present in bundle")
        }
        do {
            let fileURL = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: fileURL, options: .mappedIfSafe)
            return data
        } catch {
            fatalError("Failed to open mock data file in bundle ")
        }
    }
}
