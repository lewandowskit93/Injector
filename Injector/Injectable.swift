//
//  Injectable.swift
//  Injector
//
//  Created by Tomasz Lewandowski on 01/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public enum Injectable<T> {
    public typealias Factory = () -> T
    case singleton(_ value: T)
    case lazySingleton( _ value: T?, _ factory: Factory)
    case factory(_ factory: Factory)
        
    public func instance() -> T {
        switch self {
        case .singleton(let value):
            return value
        case .factory(let factory):
            return factory()
        case .lazySingleton(let instance, let factory):
            return instance ?? factory()
        }
    }
}

internal extension Injectable {
    func any() -> AnyInjectable {
        switch self {
        case .singleton(let value):
            return .singleton(value)
        case .lazySingleton(let value, let factory):
            return .lazySingleton(value, factory)
        case .factory(let factory):
            return .factory(factory)
        }
    }
}
