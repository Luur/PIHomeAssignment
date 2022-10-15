//
//  ProfileViewModel.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import Foundation
import Combine

protocol ProfileViewModelProtocol: ObservableObject {
    var articles: [Article] { get }
    func fetchArticles()
}

class ProfileViewModel: ProfileViewModelProtocol {
    
    private let repositoryProvider: RepositoryProvider<ArticlesRepositoryProtocol>
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var articles: [Article] = []
    
    init(repositoryProvider: RepositoryProvider<ArticlesRepositoryProtocol>) {
        self.repositoryProvider = repositoryProvider
        Timer.publish(every: 15, on: .main, in: .common).autoconnect().sink(receiveValue: { [weak self] _ in
            self?.fetchArticles()
        })
        .store(in: &subscriptions)
    }
    
    func fetchArticles() {
        let repository = repositoryProvider.repository(for: .development)
        repository.fetchArticles()
            .receive(on: DispatchQueue.main)
            .sink { _ in } receiveValue: { [weak self] articles in
                self?.articles = Array(articles.prefix(10))
            }
            .store(in: &subscriptions)
    }
}
