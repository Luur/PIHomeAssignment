//
//  ProfileAssembly.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import Swinject

final class ProfileAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ProfileViewModel.self) { resolver in
            guard let repositoryProvider = resolver.resolve(RepositoryProvider<ArticlesRepositoryProtocol>.self) else {
                fatalError("RepositoryProvider<ArticlesRepositoryProtocol> dependency could not be resolved")
            }
            return ProfileViewModel(repositoryProvider: repositoryProvider)
        }
    }
}
