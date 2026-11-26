//
//  GaleriaView.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import SwiftUI

struct GaleriaView: View {
    @State private var viewModel = GaleriaViewModel()
    
    var body: some View {
        Group {
            switch viewModel.estado {
            case .loading:
                ProgressView("Cargando postales turísticas...")
                    .scaleEffect(1.4)
                    .tint(AppColors.primary)
            case .failed(let mensaje):
                ContentUnavailableView(
                    "Error al cargar galería",
                    systemImage: "exclamationmark.triangle",
                    description: Text(mensaje)
                )
            case .loaded(let destinos):
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        ForEach(destinos) { destino in
                            GaleriaPageView(destino: destino)
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)
                .ignoresSafeArea(edges: .bottom)
            }
        }
        .navigationTitle("Postales del Mundo")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
        .ignoresSafeArea()
        .task {
            await viewModel.getGaleria()
        }
    }
}

#Preview {
    NavigationStack {
        GaleriaView()
    }
}
