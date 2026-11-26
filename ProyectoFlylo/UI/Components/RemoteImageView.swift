//
//  RemoteImageView.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import SwiftUI

struct RemoteImageView: View {
    let urlString: String
    var contentMode: ContentMode = .fill
    
    var body: some View {
        if let url = URL(string: urlString) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Color.gray.opacity(0.15)
                        ProgressView()
                            .scaleEffect(0.9)
                    }
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: contentMode)
                        .transition(.opacity.combined(with: .scale(scale: 0.98)))
                case .failure:
                    ZStack {
                        Color.gray.opacity(0.2)
                        VStack(spacing: 6) {
                            Image(systemName: "photo")
                                .font(.system(size: 24))
                                .foregroundColor(.gray)
                            Text("No disponible")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            ZStack {
                Color.gray.opacity(0.2)
                Image(systemName: "photo")
                    .foregroundColor(.gray)
            }
        }
    }
}
