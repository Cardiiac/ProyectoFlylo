//
//  DestinosPopularesView.swift
//  ProyectoFlylo
//  Integración estilizada del módulo de la PA1
//

import SwiftUI

struct DestinosPopularesView: View {
    @State private var viewModel = DestinosPopularesViewModel()

    var body: some View {
        Group {
            switch viewModel.estado {
            case .loading:
                ProgressView("Cargando destinos populares...")
                    .scaleEffect(1.3)
                    .tint(AppColors.primary)
            case .failed(let mensaje):
                ContentUnavailableView(
                    "Error",
                    systemImage: "exclamationmark.triangle",
                    description: Text(mensaje)
                )
            case .loaded(let destinos):
                ScrollView {
                    LazyVStack(spacing: 14) {
                        ForEach(destinos) { destino in
                            HStack(alignment: .top, spacing: 14) {
                                ZStack {
                                    Circle()
                                        .fill(AppColors.primaryLight)
                                        .frame(width: 60, height: 60)
                                    Image(systemName: "airplane.circle.fill")
                                        .font(.system(size: 30))
                                        .foregroundStyle(AppColors.primary)
                                }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(destino.lugar)
                                        .font(AppTypography.headline)
                                        .foregroundStyle(AppColors.secondary)
                                    
                                    Text(destino.pais)
                                        .font(AppTypography.subheadline)
                                        .foregroundStyle(AppColors.textSecondary)
                                    
                                    Text(destino.descripcion)
                                        .font(AppTypography.caption)
                                        .foregroundStyle(AppColors.textSecondary)
                                        .lineLimit(2)
                                    
                                    Text(destino.precio)
                                        .font(AppTypography.headline)
                                        .foregroundStyle(AppColors.primary)
                                        .padding(.top, 2)
                                }
                                Spacer()
                            }
                            .padding(14)
                            .background(
                                RoundedRectangle(cornerRadius: AppDimens.Radius.medium)
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 2)
                            )
                            .padding(.horizontal, 16)
                        }
                    }
                    .padding(.vertical, 14)
                }
            }
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Destinos Populares")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.getDestinos()
        }
    }
}

#Preview {
    NavigationStack {
        DestinosPopularesView()
    }
}
