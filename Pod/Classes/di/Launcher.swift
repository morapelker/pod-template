//
//  Launcher.swift
//  TedoooProfilePage
//
//  Created by Mor on 02/08/2022.
//

import Foundation
import Swinject

public class Launcher {
    
    
    public init(container: Container){
        DIContainer.shared.registerContainer(container: container)
    }
    
}
