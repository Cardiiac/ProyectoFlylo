//
//  LoginView.swift
//  ProyectoFlylo
//

import SwiftUI

struct LoginView: View {
    @Environment(AppRouter.self) private var router
    @State private var email: String = ""
    @State private var contrasena: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Spacer().frame(height: 20)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Iniciar Sesión")
                        .font(AppTypography.title)
                        .foregroundStyle(AppColors.secondary)

                    Text("Ingresa para acceder a las guías de turismo completas.")
                        .font(AppTypography.subheadline)
                        .foregroundColor(AppColors.textSecondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)

                VStack(spacing: 16) {
                    TextField("Correo electrónico", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(AppDimens.Radius.medium)
                        .overlay(
                            RoundedRectangle(cornerRadius: AppDimens.Radius.medium)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )

                    SecureField("Contraseña", text: $contrasena)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(AppDimens.Radius.medium)
                        .overlay(
                            RoundedRectangle(cornerRadius: AppDimens.Radius.medium)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                }
                .padding(.horizontal, 24)

                Button {
                    router.navigate(to: .dashboard)
                } label: {
                    Text("Ingresar")
                        .font(AppTypography.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(
                            RoundedRectangle(cornerRadius: AppDimens.Radius.medium)
                                .fill(AppColors.primary)
                        )
                }
                .padding(.horizontal, 24)

                Divider()
                    .padding(.horizontal, 32)
                    .padding(.vertical, 8)

                Button {
                    router.navigate(to: .dashboard)
                } label: {
                    HStack {
                        Text("Acceder como Invitado")
                            .font(AppTypography.headline)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(AppColors.primary)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(
                        RoundedRectangle(cornerRadius: AppDimens.Radius.medium)
                            .fill(AppColors.primaryLight)
                    )
                }
                .padding(.horizontal, 24)

                Spacer()
            }
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Acceso")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LoginView()
            .environment(AppRouter())
    }
}
