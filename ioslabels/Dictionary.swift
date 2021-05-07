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
        self.path = ""
    }
    
    public func getDictionary() -> [String: [String: String]] {
        var dictionary: [String: [String: String]] = [:]
        dictionary = ["hello": ["en": "Hello", "ru": "Привет"], "day": ["en": "Day", "ru": "День", "pt": "Dia"], "terms": ["en": "Terms", "pt": "Termos"]]
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
