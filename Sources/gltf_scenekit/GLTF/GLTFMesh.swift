//
//  GLTFMesh.swift
//
//  Created by Volodymyr Boichentsov on 09/11/2017.
//  Copyright © 2017 3D4Medical, LLC. All rights reserved.
//
//  Code generated with SchemeCompiler tool, developed by 3D4Medical.
//

import Foundation


/// A set of primitives to be rendered.  A node can contain one mesh.  A node's transform places the mesh in the scene.
@objcMembers
open class GLTFMesh : NSObject, Codable {
    /// Dictionary object with extension-specific objects.
    public var extensions:[String: [String: Codable]]?

    /// Application-specific data.
    public var extras:[String: Codable]?

    /// The user-defined name of this object.
    public var name:String?

    /// An array of primitives, each defining geometry to be rendered with a material.
    public var primitives:[GLTFMeshPrimitive]?

    /// Array of weights to be applied to the Morph Targets.
    public var weights:[Double]?

    private enum CodingKeys: String, CodingKey {
        case extensions
        case extras
        case name
        case primitives
        case weights
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        extensions = try? container.decode([String: [String: Codable]].self, forKey: .extensions)
        extras = try? container.decode([String: Codable].self, forKey: .extras)
        name = try? container.decode(String.self, forKey: .name)
        primitives = try? container.decode([GLTFMeshPrimitive].self, forKey: .primitives)
        weights = try? container.decode([Double].self, forKey: .weights)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(extensions, forKey: .extensions)
        try container.encode(extras, forKey: .extras)
        try container.encode(name, forKey: .name)
        try container.encode(primitives, forKey: .primitives)
        try container.encode(weights, forKey: .weights)
    }
}
