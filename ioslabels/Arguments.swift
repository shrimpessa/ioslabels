//
//  Arguments.swift
//  ioslabels
//
//  Created by Ксюся on 07.05.2021.
//

import Foundation

public enum Arguments {
    case search(key: String?, language: String?)
    case update(word: String, key: String, language: String)
    case delete(key: String?, language: String?)
    case help(message: String)
}
