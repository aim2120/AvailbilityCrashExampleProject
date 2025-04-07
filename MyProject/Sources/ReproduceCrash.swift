//
//  ReproduceCrash.swift
//  MyProject
//
//  Created by Annalise Mariottini on 4/7/25.
//

import Foundation
import SwiftUI
import MyPackage

func reproduceCrash() {
    print("iOS: \(UIDevice.current.systemVersion)")
    WithinPackage.countClasses_enumerateClasses()
    WithinProject.countClasses_enumerateClasses()
    WithinPackage.countClasses_getClassList()
    WithinProject.countClasses_getClassList()
    print("Did not crash")
}

enum WithinPackage {
    static func countClasses_enumerateClasses() {
        print(#function)
        let conformingClasses: [any MyPackageProtocol] = objc_enumerateClasses(conformingTo: MyPackageProtocol.self)
            .lazy
            .compactMap { ($0 as? MyPackageProtocol.Type)?.init() }
        print("Conforming classes: \(conformingClasses.count)")
    }

    static func countClasses_getClassList() {
        print(#function)
        let numberOfClasses = Int(objc_getClassList(nil, 0))

        guard numberOfClasses > 0 else { return }

        let classesPtr = UnsafeMutablePointer<AnyClass>.allocate(capacity: numberOfClasses)
        let classes = (0..<numberOfClasses).map { classesPtr[$0] }
        let conformingClasses = classes.lazy.filter {
            class_conformsToProtocol($0, MyPackageProtocol.self)
        }.compactMap {
            ($0 as? MyPackageProtocol.Type)?.init()
        }
        print("Conforming classes: \(conformingClasses.count)")
    }
}

enum WithinProject {
    static func countClasses_enumerateClasses() {
        print(#function)
        let conformingClasses: [any MyProjectProtocol] = objc_enumerateClasses(conformingTo: MyProjectProtocol.self)
            .lazy
            .compactMap { ($0 as? MyProjectProtocol.Type)?.init() }
        print("Conforming classes: \(conformingClasses.count)")
    }

    static func countClasses_getClassList() {
        print(#function)
        let numberOfClasses = Int(objc_getClassList(nil, 0))

        guard numberOfClasses > 0 else { return }

        let classesPtr = UnsafeMutablePointer<AnyClass>.allocate(capacity: numberOfClasses)
        let classes = (0..<numberOfClasses).map { classesPtr[$0] }
        let conformingClasses = classes.lazy.filter {
            class_conformsToProtocol($0, MyProjectProtocol.self)
        }.compactMap {
            ($0 as? MyProjectProtocol.Type)?.init()
        }
        print("Conforming classes: \(conformingClasses.count)")
    }
}
