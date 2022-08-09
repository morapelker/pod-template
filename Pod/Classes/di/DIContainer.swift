//
//  DICOntainer.swift
//  TedoooProfilePage
//
//  Created by Mor on 02/08/2022.
//

import Foundation
import Swinject

class DIContainer {
    static let shared = DIContainer()
    private var container: Container!
    
    func registerContainer(container: Container) {
        self.container = container
    }

    public func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}
