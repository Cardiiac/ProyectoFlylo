//
//  AtractivosView.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import SwiftUI

struct AtractivosView: View {
    let categoria: CategoriaTour
    @State private var viewModel = AtractivosViewModel()
    
    var body: some View {
        Group {
            switch viewModel.estado {
            case .loading:
                ProgressView("Cargando atractivos turísticos...")
                    .scaleEffect(1.3)
                    .tint(AppColors.primary)
            case .failed(let mensaje):
                ContentUnavailableView {
                    Label("Error", systemImage: "exclamationmark.triangle")
                } description: {
                    Text(mensaje)
                }
            case .loaded(let atractivos):
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 14), GridItem(.flexible(), spacing: 14)], spacing: 16) {
                        ForEach(atractivos) { atractivo in
                            NavigationLink(value: AppRoute.atractivodetalle(atractivo: atractivo)) {
                                AtractivoCardView(atractivo: atractivo)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(16)
                }
            }
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle(categoria.nombre)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.getAtractivos(idCategoria: categoria.id)
        }
    }
}

#Preview {
    NavigationStack {
        AtractivosView(categoria: CategoriaTour(
            idcategoria: 1,
            nombre: "Cultural",
            descripcion: "Desc",
            foto: "",
            total: 4
        ))
    }
}
