//
//  TerminalOutputProtocol.swift
//  ioslabels
//
//  Created by Ксюся on 07.05.2021.
//

import Foundation

public protocol TerminalOutputProtocol {
    func consoleOutput(word: String)
    func outputTemplates(variant: TemplateOptions, firstArgument: String, secondArgument: String)
    func outputNotFound(isInDictionary: Bool)
}
