//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation
import Combine

public extension Publisher {
    /// Perform a validation, if the validation succeeds the stream continues, otherwise it throws an error
    func validate(_ validator: @escaping (Output) throws -> Void
    ) -> Publishers.TryMap<Self, Output> {
        tryMap { output in
            try validator(output)
            return output
        }
    }
}
