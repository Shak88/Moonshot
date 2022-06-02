//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Shokri Alnajjar on 01/06/2022.
//

import Foundation

extension Bundle {
    func decode<T : Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Faild to Locate \(file) in Bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from Bundle")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to Decode \(file) from Bundle")
        }
        
        return loaded
    }
}
