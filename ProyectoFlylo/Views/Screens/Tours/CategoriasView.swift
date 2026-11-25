//
//  CategoriasView.swift
//  ProyectoFlylo
//  Pantalla 1 del Maestro-Detalle (Categorías) - Idéntica a TiendaView de ProyectoLoki
//

import SwiftUI

struct CategoriasView: View {
    @State private var viewModel = CategoriasViewModel()
    
    var body: some View {
        Group {
            switch viewModel.estado {
            case .loading:
                ProgressView("Cargando categorías turísticas...")
                    .scaleEffect(1.3)
                    .tint(AppColors.primary)
            case .failed(let mensaje):
                ContentUnavailableView {
                    Label("Error", systemImage: "exclamationmark.triangle")
                } description: {
                    Text(mensaje)
                }
            case .loaded(let categorias):
                ScrollView {
                    LazyVStack(spacing: AppDimens.Spacing.medium) {
                        ForEach(categorias) { categoria in
                            NavigationLink(value: AppRoute.atractivos(categoria: categoria)) {
                                CategoriaCardView(categoria: categoria)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.vertical, 14)
                }
            }
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Categorías")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.getCategorias()
        }
    }
}

#Preview {
    NavigationStack {
        CategoriasView()
    }
}
