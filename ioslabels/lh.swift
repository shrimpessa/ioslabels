//
//  lh.swift
//  ioslabels
//
//  Created by Ксюся on 07.05.2021.
//

import Foundation

public class Container {
    
    var dict = Dictionary()
    
    var message: TerminalOutputProtocol {
        TerminalOutput()
    }
    var search: SearchProtocol {
        Search(dictionary: dict, terminalOutput: message)
    }    
}
