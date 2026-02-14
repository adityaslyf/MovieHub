//
//  HomeView.swift
//  MovieHub
//
//  Created by Aditya Varshney on 06/02/26.
//

import SwiftUI

struct HomeView: View {
    var heroTestTitle = Constants.testTitleURL
    var viewModel = ViewModel()
    
    var body: some View {
        GeometryReader {geo in
            ScrollView(.vertical) {
                switch  viewModel.homeStatus {
                case .notStarted:
                    EmptyView()
                case .fetching:
                    ProgressView()
                case .success:
                    LazyVStack {
                        AsyncImage(url: URL(string: heroTestTitle)){ image in
                            image
                                .resizable()
                                .scaledToFit()
                                .overlay {
                                    LinearGradient(
                                        stops: [Gradient.Stop(color: .clear, location: 0.8),
                                                Gradient.Stop(color: .gradient, location: 1)
                                               ],
                                        startPoint: .top,
                                        endPoint: .bottom)
                                }
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: geo.size.width, height: geo.size.height * 0.85) // 85% of screen
                        
                        HStack {
                            Button{
                            } label: {
                                Text(Constants.playString)
                                    .ghostButton()
                                
                            }
                            
                            Button{
                            } label: {
                                Text(Constants.downloadString)
                                    .ghostButton()
                            }
                        }
                        HorizontalListView(header: Constants.trendingMovieString, titles: viewModel.trendingMovies)
                        //                HorizontalListView(header: Constants.trendingTVString, titles: [])
                        //                HorizontalListView(header: Constants.topRatedMovieString, titles: [])
                        //                HorizontalListView(header: Constants.topRatedTVString, titles: [])
                        
                    }
                case .failed(let error):
                    Text("Error: \(error.localizedDescription)")
                }
            }
            .task {
                await viewModel.getTitles()
            }
        }
    }
    
}

#Preview {
    HomeView()
}

