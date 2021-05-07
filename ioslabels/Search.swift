//
//  Search.swift
//  ioslabels
//
//  Created by Ксюся on 07.05.2021.
//

import Foundation

public class Search: SearchProtocol {
    
    let output: TerminalOutputProtocol
    let dict: DictionaryProtocol
    var isInDictionary: Bool
    
    init(dictionary: DictionaryProtocol, terminalOutput: TerminalOutputProtocol) {
        self.dict = dictionary
        self.output = terminalOutput
        self.isInDictionary = false
    }
    
    public func search(key: String?, language: String?) -> String {
        var stringResult: String = ""
        do {
            let dictionary = try dict.getDictionary()
            
            if key == nil && language == nil {
                stringResult = defaultSearch(dictionary: dictionary)
                isInDictionary = true
                return stringResult
            }
            
            if let key: String = key, language == nil {
                stringResult += key.uppercased() + "! "
            }
            for (englishWord, wordsArray) in dictionary {
                // -l
                if key == nil, let language: String = language, let word = wordsArray[language.lowercased()] {
                    stringResult += englishWord + " = " + word + " "
                    isInDictionary = true
                }
                for (_, dictionaryTranslation) in wordsArray {
                    if let key: String = key, dictionaryTranslation.lowercased() == key.lowercased() {
                        for (thisLanguage, thisTranslation) in wordsArray {
                            // -k
                            if language == nil {
                                stringResult += thisLanguage + " : " + thisTranslation + " "
                                isInDictionary = true
                            // -k -l
                            } else if let language: String = language, thisLanguage == language.lowercased() {
                                stringResult += thisTranslation + " "
                                isInDictionary = true
                            }
                        }
                    }
                }
            }
            if isInDictionary == false {stringResult = "Not found"}
        } catch {
            print("Не удалось найти")
        }
        return stringResult
    }

    public func defaultSearch(dictionary: [String: [String: String]]) -> String {
        var stringResult: String = ""
        
        for (englishWord, wordsArray) in dictionary {
            stringResult += englishWord.uppercased() + "! "
            for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
                stringResult += dictionaryLanguage + ": " + dictionaryTranslation + " "
            }
            stringResult += "| "
        }
        return stringResult
    }
    
}
