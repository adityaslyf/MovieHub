//
//  HorizontalListView.swift
//  MovieHub
//
//  Created by Aditya Varshney on 06/02/26.
//

import SwiftUI

struct HorizontalListView: View {
    let header : String
    var titles = [Constants.testTitleURL, Constants.testTitleURL2, Constants.testTitleURL3]
    
    var body: some View {
        VStack(alignment:  .leading) {
            Text(header)
                .font(.title)
            
            ScrollView (.horizontal) {
                LazyHStack {
                    ForEach(titles, id:\.self) {title in
                        AsyncImage(url: URL(string: title)) { image in
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
    HorizontalListView(header: Constants.trendingMovieString)
}
