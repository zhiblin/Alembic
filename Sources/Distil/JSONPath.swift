//
//  JSONPath.swift
//  Alembic
//
//  Created by Ryo Aoyama on 3/13/16.
//  Copyright © 2016 Ryo Aoyama. All rights reserved.
//

import Foundation

// MARK: - JSONPath

public struct JSONPath: Equatable {
    let paths: [JSONPathElement]
    
    public init(_ path: JSONPathElement) {
        paths = [path]
    }
    
    public init(_ paths: [JSONPathElement]) {
        self.paths = paths
    }
}

// MARK: - Operators

public func == (lhs: JSONPath, rhs: JSONPath) -> Bool {
    return lhs.paths == rhs.paths
}

public func + (lhs: JSONPath, rhs: JSONPath) -> JSONPath {
    return JSONPath(lhs.paths + rhs.paths)
}

// MARK: - CustomStringConvertible

extension JSONPath: CustomStringConvertible {
    public var description: String {
        return "JSONPath(\(paths))"
    }
}

// MARK: - CustomDebugStringConvertible

extension JSONPath: CustomDebugStringConvertible {
    public var debugDescription: String {
        return description
    }
}

// MARK: - LiteralConvertible

extension JSONPath: StringLiteralConvertible {
    public init(unicodeScalarLiteral value: String) {
        self.init(.Key(value))
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(.Key(value))
    }
    
    public init(stringLiteral value: String) {
        self.init(.Key(value))
    }
}

extension JSONPath: IntegerLiteralConvertible {
    public init(integerLiteral value: Int) {
        self.init(.Index(value))
    }
}

extension JSONPath: ArrayLiteralConvertible {
    public init(arrayLiteral elements: JSONPathElement...) {
        self.init(elements)
    }
}

// MARK: - JSONPathElement

public enum JSONPathElement: Equatable {
    case Key(String)
    case Index(Int)
}

// MARK: - Operators

public func == (lhs: JSONPathElement, rhs: JSONPathElement) -> Bool {
    switch (lhs, rhs) {
    case let (.Key(lKey), .Key(rKey)): return lKey == rKey
    case let (.Index(lIndex), .Index(rIndex)): return lIndex == rIndex
    default: return false
    }
}

// MARK: - CustomStringConvertible

extension JSONPathElement: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .Key(key): return "\(key)"
        case let .Index(index): return "\(index)"
        }
    }
}

// MARK: - CustomDebugStringConvertible

extension JSONPathElement: CustomDebugStringConvertible {
    public var debugDescription: String {
        return description
    }
}

// MARK: - LiteralConvertible

extension JSONPathElement: StringLiteralConvertible {
    public init(unicodeScalarLiteral value: String) {
        self = .Key(value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self = .Key(value)
    }
    
    public init(stringLiteral value: String) {
        self = .Key(value)
    }
}

extension JSONPathElement: IntegerLiteralConvertible {
    public init(integerLiteral value: Int) {
        self = .Index(value)
    }
}