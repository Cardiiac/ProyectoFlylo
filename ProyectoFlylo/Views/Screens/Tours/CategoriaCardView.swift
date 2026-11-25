//
//  CategoriaCardView.swift
//  ProyectoFlylo
//  Inspirado en CategoriaCardView de ProyectoLoki
//

import SwiftUI

struct CategoriaCardView: View {
    let categoria: CategoriaTour
    
    var body: some View {
        HStack(spacing: 16) {
            RemoteImageView(urlString: categoria.foto, contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: AppDimens.Radius.medium))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(categoria.nombre)
                    .font(AppTypography.title3)
                    .foregroundStyle(AppColors.secondary)
                    .lineLimit(1)
                
                Text(categoria.descripcion)
                    .font(AppTypography.caption)
                    .foregroundStyle(AppColors.textSecondary)
                    .lineLimit(2)
                
                HStack {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundStyle(AppColors.primary)
                    Text("\(categoria.total) atractivos")
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundStyle(AppColors.primary)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(AppColors.textSecondary.opacity(0.6))
                .padding(.trailing, 8)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: AppDimens.Radius.medium)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 2)
        )
        .padding(.horizontal, 16)
    }
}
