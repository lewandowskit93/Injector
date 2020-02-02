//
//  InjectorError.swift
//  Injector
//
//  Created by Tomasz Lewandowski on 01/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public enum InjectorError: Error {
    case notRegistered
    case alreadyRegistered
    case invalidType
}
