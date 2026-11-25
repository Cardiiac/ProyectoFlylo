//
//  BienvenidaView.swift
//  ProyectoFlylo
//  Inspirado en Behance FlyloAI
//

import SwiftUI

struct BienvenidaView: View {
    @Environment(AppRouter.self) private var router
    
    var body: some View {
        ZStack {
            AppColors.background.ignoresSafeArea()
            
            VStack(spacing: 24) {
                Spacer()
                
                // Emblema Flylo
                ZStack {
                    Circle()
                        .fill(AppColors.primaryLight)
                        .frame(width: 130, height: 130)
                    
                    Image(systemName: "globe.americas.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                        .foregroundStyle(AppColors.primary)
                }
                
                VStack(spacing: 12) {
                    Text("Flylo Turismo")
                        .font(AppTypography.largeTitle)
                        .foregroundStyle(AppColors.secondary)
                    
                    Text("Descubre las maravillas del mundo")
                        .font(AppTypography.title3)
                        .foregroundStyle(AppColors.primary)
                    
                    Text("Explora los destinos culturales, naturales y arquitectónicos más fascinantes de nuestro planeta.")
                        .font(AppTypography.body)
                        .foregroundStyle(AppColors.textSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                }
                
                Spacer()
                
                // Botón principal
                VStack(spacing: 14) {
                    Button {
                        router.navigate(to: .dashboard)
                    } label: {
                        HStack {
                            Text("Explorar Destinos")
                                .font(AppTypography.headline)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 54)
                        .background(
                            RoundedRectangle(cornerRadius: AppDimens.Radius.medium)
                                .fill(AppColors.primary)
                                .shadow(color: AppColors.primary.opacity(0.35), radius: 10, y: 5)
                        )
                    }
                    
                    Button {
                        router.navigate(to: .login)
                    } label: {
                        Text("Iniciar Sesión")
                            .font(AppTypography.subheadline)
                            .foregroundStyle(AppColors.textSecondary)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        BienvenidaView()
            .environment(AppRouter())
    }
}
