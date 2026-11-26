//
//  EstadisticasView.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import SwiftUI
import Charts

struct EstadisticasView: View {
    @State private var viewModel = EstadisticasViewModel()
    
    var body: some View {
        Group {
            switch viewModel.estado {
            case .loading:
                ProgressView("Cargando estadísticas mundiales...")
                    .scaleEffect(1.3)
                    .tint(AppColors.primary)
            case .failed(let mensaje):
                ContentUnavailableView(
                    "Error al cargar estadísticas",
                    systemImage: "chart.bar.xaxis",
                    description: Text(mensaje)
                )
            case .loaded(let datos):
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Encabezado
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Afluencia Turística Anual")
                                .font(AppTypography.title)
                                .foregroundStyle(AppColors.secondary)
                            
                            Text("Millones de turistas internacionales por destino (Datos obtenidos de Alwaysdata).")
                                .font(AppTypography.subheadline)
                                .foregroundStyle(AppColors.textSecondary)
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        
                        // Tarjeta del Gráfico de Barras
                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                Image(systemName: "chart.bar.fill")
                                    .foregroundStyle(AppColors.primary)
                                Text("Visitantes Anuales (Millones)")
                                    .font(AppTypography.headline)
                                    .foregroundStyle(AppColors.secondary)
                            }
                            
                            Chart {
                                ForEach(datos) { item in
                                    BarMark(
                                        x: .value("Destino", item.destino),
                                        y: .value("Visitantes", item.visitantes)
                                    )
                                    .foregroundStyle(AppColors.primary.gradient)
                                    .cornerRadius(6)
                                    .annotation(position: .top, spacing: 4) {
                                        Text(item.etiqueta)
                                            .font(.system(size: 10, weight: .bold))
                                            .foregroundColor(AppColors.secondary)
                                    }
                                }
                            }
                            .frame(height: 260)
                            .chartYAxis {
                                AxisMarks(position: .leading)
                            }
                            .chartXAxis {
                                AxisMarks { _ in
                                    AxisValueLabel()
                                        .font(.caption2)
                                }
                            }
                        }
                        .padding(16)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: AppDimens.Radius.medium))
                        .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 3)
                        .padding(.horizontal, 16)
                        
                        // Tabla de desglose de datos
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Tabla Comparativa")
                                .font(AppTypography.title3)
                                .foregroundStyle(AppColors.secondary)
                            
                            VStack(spacing: 8) {
                                ForEach(datos) { item in
                                    HStack {
                                        ZStack {
                                            Circle()
                                                .fill(AppColors.primaryLight)
                                                .frame(width: 32, height: 32)
                                            Text("\(item.id)")
                                                .font(.caption)
                                                .fontWeight(.bold)
                                                .foregroundStyle(AppColors.primary)
                                        }
                                        
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(item.destino)
                                                .font(.subheadline)
                                                .fontWeight(.semibold)
                                                .foregroundStyle(AppColors.secondary)
                                            Text(item.pais)
                                                .font(.caption2)
                                                .foregroundStyle(AppColors.textSecondary)
                                        }
                                        
                                        Spacer()
                                        
                                        Text("\(String(format: "%.1f", item.visitantes))M turistas")
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                            .foregroundStyle(AppColors.primary)
                                    }
                                    .padding(10)
                                    .background(AppColors.background)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                            }
                        }
                        .padding(16)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: AppDimens.Radius.medium))
                        .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 3)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 24)
                    }
                }
            }
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Estadísticas")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.getEstadisticas()
        }
    }
}

#Preview {
    NavigationStack {
        EstadisticasView()
    }
}
