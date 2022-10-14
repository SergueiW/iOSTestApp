//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation

protocol MapperProtocol: Codable {
    associatedtype T
    
    func execute() -> T
}
