//
//  Dictionary.swift
//  ioslabels
//
//  Created by Ксюся on 07.05.2021.
//

import Foundation

public class Dictionary: DictionaryProtocol {
    
    let path: String
    
    init() {
        self.path = Bundle.main.path(forResource: "dictionary", ofType: "json") ?? ""
    }
    
    public func getDictionary() -> [String: [String: String]] {
        var dictionary: [String: [String: String]] = [:]
        if let jsonDictionaryFile = FileManager.default.contents(atPath: path) {
            dictionary = (try? JSONDecoder().decode([String: [String: String]].self, from: jsonDictionaryFile)) ?? [:]
        } else {
            print(ValidationResult.failedToRead)
        }
        return dictionary
    }

    public func write(dictionary: [String: [String: String]]) {
        
        do {
            if !dictionary.isEmpty {
                let json = try JSONEncoder().encode(dictionary.self)
                try json.write(to: URL(fileURLWithPath: path))
            } else {
                print(ValidationResult.failedToWrite)
            }           
        }
        catch {
            print("Не удалось записать.")
        }
        
    }

}
