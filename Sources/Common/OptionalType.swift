//
//  OptionalType.swift
//  Alembic
//
//  Created by Ryo Aoyama on 3/13/16.
//  Copyright © 2016 Ryo Aoyama. All rights reserved.
//

public protocol OptionalType {
    associatedtype Wrapped
    
    var optionalValue: Optional<Wrapped> { get }
}

extension Optional: OptionalType {
    public var optionalValue: Optional<Wrapped> {
        return self
    }
}