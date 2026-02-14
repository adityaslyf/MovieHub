//
//  HorizontalListView.swift
//  MovieHub
//
//  Created by Aditya Varshney on 06/02/26.
//

import SwiftUI

struct HorizontalListView: View {
    let header : String
    var titles : [Title]
    
    var body: some View {
        VStack(alignment:  .leading) {
            Text(header)
                .font(.title)
            
            ScrollView (.horizontal) {
                LazyHStack {
                    ForEach(titles) {title in
                        AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 200)
                        .padding(5)
                    }
                }
            }
        }
        .frame(height: 250)
    }
}

#Preview {
    HorizontalListView(header: Constants.trendingMovieString, titles: Title.previewTitles)
}
