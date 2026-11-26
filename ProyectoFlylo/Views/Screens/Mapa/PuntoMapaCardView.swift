//
//  PuntoMapaCardView.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import SwiftUI

struct PuntoMapaCardView: View {
    let punto: PuntoMapa
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(punto.tipo.uppercased())
                    .font(.caption2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(AppColors.primaryLight)
                    .foregroundColor(AppColors.primary)
                    .clipShape(Capsule())
                
                Spacer()
                
                Text("\(punto.ciudad), \(punto.pais)")
                    .font(.caption)
                    .foregroundStyle(AppColors.textSecondary)
            }
            
            Text(punto.nombre)
                .font(AppTypography.title3)
                .foregroundStyle(AppColors.secondary)
            
            HStack(spacing: 4) {
                Image(systemName: "mappin.and.ellipse")
                    .font(.caption)
                    .foregroundStyle(AppColors.primary)
                Text(punto.direccion)
                    .font(AppTypography.caption)
                    .foregroundStyle(AppColors.textSecondary)
                    .lineLimit(1)
            }
            
            HStack {
                Text("Coordenadas: \(String(format: "%.4f", punto.latitud)), \(String(format: "%.4f", punto.longitud))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                Spacer()
                Text(punto.telefono)
                    .font(.caption2)
                    .foregroundColor(AppColors.primary)
            }
            .padding(.top, 2)
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: AppDimens.Radius.medium)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.12), radius: 8, x: 0, y: 3)
        )
    }
}
