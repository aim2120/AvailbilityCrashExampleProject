//
//  MyProtocol.swift
//  MyProject
//
//  Created by Annalise Mariottini on 4/7/25.
//

import Foundation
import Translation

@objc public protocol MyProjectProtocol: NSObjectProtocol {
    init()
}


@objc
public final class MyClass: NSObject, MyProjectProtocol {
    public override init() {
        print("Initialize \(String(describing: Self.self))")
    }
}

@objc
@available(iOS 18, *)
public final class MyClassiOS18Only: NSObject {
    @objc
    @available(iOS 18, *)
    public override init() {
        print("Initialize \(String(describing: Self.self))")
        if #available(iOS 18, *) {
            print("iOS is 18")
        } else {
            print("iOS is 17")
        }
    }

    // iOS 18+ API
    var config: TranslationSession.Configuration? = nil
}
