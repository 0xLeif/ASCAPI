//
//  AnyPublisher+.swift
//  
//
//  Created by Zach Eriksen
//

import Foundation
import OpenCombine

extension AnyPublisher {
    func value(_ closure: @escaping ((Output) -> Void)) -> AnyCancellable {
        sink(receiveCompletion: { _ in }, receiveValue: closure)
    }
}
