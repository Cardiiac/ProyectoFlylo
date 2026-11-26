//
//  AtractivoCardView.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import SwiftUI

struct AtractivoCardView: View {
    let atractivo: Atractivo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                RemoteImageView(urlString: atractivo.imagenchica, contentMode: .fill)
                    .frame(height: 125)
                    .frame(maxWidth: .infinity)
                    .clipped()
                
                // Badge de valoración
                HStack(spacing: 3) {
                    Image(systemName: "star.fill")
                        .font(.system(size: 10))
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", atractivo.valoracion))
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 7)
                .padding(.vertical, 4)
                .background(Color.black.opacity(0.65))
                .clipShape(Capsule())
                .padding(8)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(atractivo.nombre)
                    .font(AppTypography.headline)
                    .foregroundStyle(AppColors.secondary)
                    .lineLimit(1)
                
                HStack(spacing: 4) {
                    Image(systemName: "mappin")
                        .font(.system(size: 11))
                        .foregroundStyle(AppColors.primary)
                    Text("\(atractivo.ciudad), \(atractivo.pais)")
                        .font(AppTypography.caption)
                        .foregroundStyle(AppColors.textSecondary)
                        .lineLimit(1)
                }
                
                if let precio = atractivo.precioguia {
                    HStack {
                        Text("Desde $\(Int(precio)) USD")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(AppColors.primary)
                        Spacer()
                        Text(atractivo.duracion)
                            .font(.caption2)
                            .foregroundStyle(AppColors.textSecondary)
                    }
                    .padding(.top, 2)
                }
            }
            .padding(10)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: AppDimens.Radius.medium))
        .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 3)
    }
}
