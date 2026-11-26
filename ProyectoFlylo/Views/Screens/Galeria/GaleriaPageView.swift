//
//  GaleriaPageView.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import SwiftUI

struct GaleriaPageView: View {
    let destino: DestinoGaleria
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottomLeading) {
                // Imagen remota a pantalla completa
                RemoteImageView(urlString: destino.foto, contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .clipped()
                
                // Gradiente vertical para contraste óptico
                LinearGradient(
                    colors: [
                        .clear,
                        .black.opacity(0.25),
                        .black.opacity(0.85)
                    ],
                    startPoint: .center,
                    endPoint: .bottom
                )
                
                // Datos del destino alineados en la parte inferior
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(destino.pais)
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(AppColors.primary)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                        Spacer()
                    }
                    
                    Text(destino.titulo)
                        .font(AppTypography.largeTitle)
                        .foregroundColor(.white)
                    
                    Text(destino.subtitulo)
                        .font(AppTypography.title3)
                        .foregroundColor(.white.opacity(0.9))
                    
                    Text(destino.descripcion)
                        .font(AppTypography.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                        .lineLimit(3)
                        .padding(.top, 4)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 60)
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
        .ignoresSafeArea()
    }
}
