//
//  AlbumListViewModel.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import Espresso

class AlbumListViewModel: ViewModel {
    
    private let network: NetworkServiceProtocol
    private let favorite: FavoriteServiceProtocol
    
    @Published private(set) var isLoading = false
    @Published private(set) var isShowingFavorites: Bool = false
    @Published private(set) var albums = [Album]()
    
    private var favoriteAlbums: [Album] {
        return self.favorite.albums.value
    }
    
    private var defaultAlbums = [Album]()
    private var bag = CancellableBag()
    
    init(network: NetworkServiceProtocol,
         favorite: FavoriteServiceProtocol) {
        
        self.network = network
        self.favorite = favorite
        
        bind()
        
    }
    
    func loadInitialData() {
        
        Task {
            await _loadInitialData()
        }
        
    }
    
    @MainActor
    func didStartSearching() {
        
        if self.isShowingFavorites {
            toggleFavorites()
        }
        
    }
    
    func search(query: String) {
                        
        Task {
            await _search(query: query)
        }
        
    }
    
    @MainActor
    func didEndSearching() {
        self.albums = self.defaultAlbums
    }
    
    @MainActor
    func toggleFavorites() {
        
        if !self.isShowingFavorites {
            self.albums = self.favoriteAlbums
        }
        else {
            self.albums = self.defaultAlbums
        }
        
        self.isShowingFavorites
            .toggle()

    }
    
    // MARK: Private
    
    private func bind() {
        
        self.bag
            .removeAll()
        
        self.favorite.albums
            .receiveOnMain()
            .sink { albums in
                
                if self.isShowingFavorites {
                    self.albums = self.favoriteAlbums
                }
                
            }
            .store(in: &self.bag)
        
    }
     
    private func _loadInitialData() async {
        
        guard !self.isLoading else { return }
        
        await self._search(
            query: "memes",
            defaults: true
        )
        
    }
    
    private func _search(query: String,
                         defaults: Bool = false) async {
        
        let normalizedQuery = query
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !self.isLoading, !normalizedQuery.isEmpty else { return }
        
        await MainActor.run {
            self.isLoading = true
        }
        
        let albums = (try? await self.network.albumSearch(query: normalizedQuery)) ?? []
                
        await MainActor.run {
            
            self.isLoading = false
            self.albums = albums
            
            if defaults {
                self.defaultAlbums = albums
            }

        }
        
    }
    
}
