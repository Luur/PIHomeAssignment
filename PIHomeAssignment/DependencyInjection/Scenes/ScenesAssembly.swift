//
//  ScenesAssembly.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import Foundation
import Swinject

final class ScenesAssembly: Assembly {
    func assemble(container: Container) {
        let assemblies: [Assembly] = [ProfileAssembly(), MarketAssembly()]
        assemblies.forEach { $0.assemble(container: container) }
    }
}

