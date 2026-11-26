//
//  AtractivoDetalleItemView.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import SwiftUI

struct AtractivoDetalleItemView: View {
    let atractivo: Atractivo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            // Imagen principal grande
            ZStack(alignment: .topTrailing) {
                RemoteImageView(
                    urlString: atractivo.imagengrande ?? atractivo.imagenchica,
                    contentMode: .fill
                )
                .frame(height: 250)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: AppDimens.Radius.medium))
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", atractivo.valoracion))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .font(.subheadline)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Color.black.opacity(0.65))
                .clipShape(Capsule())
                .padding(12)
            }
            
            // Título y País
            VStack(alignment: .leading, spacing: 6) {
                Text(atractivo.nombre)
                    .font(AppTypography.title)
                    .foregroundStyle(AppColors.secondary)
                
                HStack(spacing: 6) {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundStyle(AppColors.primary)
                    Text("\(atractivo.ciudad), \(atractivo.pais)")
                        .font(AppTypography.title3)
                        .foregroundStyle(AppColors.textSecondary)
                }
            }
            
            // Fila de Precio / Guía
            if let precio = atractivo.precioguia {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Costo referencial de tour:")
                            .font(.caption)
                            .foregroundStyle(AppColors.textSecondary)
                        Text("$\(Int(precio)) USD")
                            .font(AppTypography.title2)
                            .foregroundStyle(AppColors.primary)
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 2) {
                        Text("Duración estimada:")
                            .font(.caption)
                            .foregroundStyle(AppColors.textSecondary)
                        Text(atractivo.duracion)
                            .font(AppTypography.headline)
                            .foregroundStyle(AppColors.secondary)
                    }
                }
                .padding(14)
                .background(AppColors.primaryLight.opacity(0.7))
                .clipShape(RoundedRectangle(cornerRadius: AppDimens.Radius.medium))
            }
            
// Ficha técnica del destino
            VStack(alignment: .leading, spacing: 10) {
                Text("Ficha Turística")
                    .font(AppTypography.title3)
                    .foregroundStyle(AppColors.secondary)
                
                Grid(alignment: .leading, horizontalSpacing: 12, verticalSpacing: 8) {
                    FilaDatoTurismo(etiqueta: "País", valor: atractivo.pais)
                    FilaDatoTurismo(etiqueta: "Ciudad", valor: atractivo.ciudad)
                    FilaDatoTurismo(etiqueta: "Mejor época", valor: atractivo.mejor_epoca)
                    FilaDatoTurismo(etiqueta: "Clima", valor: atractivo.clima)
                    FilaDatoTurismo(etiqueta: "Altitud", valor: atractivo.altitud)
                    if let cupos = atractivo.unidadesenexistencia {
                        FilaDatoTurismo(etiqueta: "Aforo diario", valor: "\(cupos) visitantes")
                    }
                    if let detalle = atractivo.detalle {
                        FilaDatoTurismo(etiqueta: "Resumen", valor: detalle)
                    }
                }
                .padding(14)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: AppDimens.Radius.medium))
                .shadow(color: Color.black.opacity(0.04), radius: 5, y: 2)
            }
            
            // Descripción detallada
            if let desc = atractivo.descripcion, !desc.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Acerca de este lugar")
                        .font(AppTypography.title3)
                        .foregroundStyle(AppColors.secondary)
                    
                    Text(desc.htmlToPlainText)
                        .font(AppTypography.body)
                        .foregroundStyle(AppColors.textSecondary)
                        .lineSpacing(4)
                }
                .padding(14)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: AppDimens.Radius.medium))
                .shadow(color: Color.black.opacity(0.04), radius: 5, y: 2)
            }
        }
        .padding(16)
    }
}

struct FilaDatoTurismo: View {
    let etiqueta: String
    let valor: String?
    
    var body: some View {
        if let valor = valor, !valor.isEmpty {
            GridRow {
                Text(etiqueta)
                    .font(.subheadline)
                    .foregroundColor(AppColors.textSecondary)
                    .gridColumnAlignment(.leading)
                Text(valor)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(AppColors.secondary)
            }
            Divider().gridCellColumns(2)
        }
    }
}
