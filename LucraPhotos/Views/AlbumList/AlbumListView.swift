//
//  AlbumListView.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import SwiftUI
import EspressoUI

struct AlbumListiew: View {
    
    @StateObject private var viewModel: AlbumListViewModel
    @State private var query: String = ""
    @State private var isShowingSearch = false
    
    init(viewModel: AlbumListViewModel) {
        self._viewModel = viewModel.asStateObject()
    }
    
    var body: some View {
        
        ScrollView {
            
            LazyVGrid(columns: [.init(.adaptive(minimum: 100))]) {
                
                ForEach(self.viewModel.albums) { album in
                    
                    NavigationLink(value: NavRoute.album(album)) {
                        PhotoItemView(photo: album.photos.first)
                    }
                    
                }
                
            }
            .padding()
            
        }
        .navigationTitle("Albums")
        .onFirstAppear() {
            self.viewModel.loadInitialData()
        }
        .searchable(
            text: self.$query,
            isPresented: self.$isShowingSearch,
            prompt: "Search for albums..."
        )
        .onSubmit(of: .search) {
            self.viewModel.search(query: self.query)
        }
        .onChange(of: self.isShowingSearch) {
            
            self.isShowingSearch ?
                self.viewModel.didStartSearching() :
                self.viewModel.didEndSearching()
            
        }
        .allowsHitTesting(!self.viewModel.isLoading)
        .toolbar {
            
            Button {
                
                self.viewModel
                    .toggleFavorites()
                
            } label: {
               
                Image(systemSymbol: self.viewModel.isShowingFavorites ? .starFill : .star)
                
            }
            
        }
        .overlay {
            
            if self.viewModel.isLoading {
                LoadingView()
            }
            else if self.viewModel.albums.isEmpty {
                
                NoDataView(
                    symbol: .eyeSlash,
                    title: "No Albums",
                    message: "Try searching for something else"
                )
                
            }
            
        }
        
    }
    
}
