//
//  DictionaryProtocol.swift
//  ioslabels
//
//  Created by Ксюся on 07.05.2021.
//

import Foundation

public protocol DictionaryProtocol {
    func getDictionary() throws -> [String: [String: String]]
    func write(dictionary: [String: [String: String]])
}
