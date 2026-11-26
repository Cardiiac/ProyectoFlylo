//
//  DashboardView.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import SwiftUI

struct MenuItemTurismo: Identifiable, Hashable {
    let id: String
    let nombre: String
    let descripcion: String
    let icono: String
    let ruta: AppRoute?
    
    init(nombre: String, descripcion: String, icono: String, ruta: AppRoute? = nil) {
        self.id = nombre
        self.nombre = nombre
        self.descripcion = descripcion
        self.icono = icono
        self.ruta = ruta
    }
}

extension MenuItemTurismo {
    static let menuItems: [MenuItemTurismo] = [
        MenuItemTurismo(
            nombre: "Categorías",
            descripcion: "Maravillas y atractivos por tema",
            icono: "square.grid.2x2.fill",
            ruta: .categorias
        ),
        MenuItemTurismo(
            nombre: "Galería",
            descripcion: "Postales turísticas en HD",
            icono: "photo.stack.fill",
            ruta: .galeria
        ),
        MenuItemTurismo(
            nombre: "Mapa Turístico",
            descripcion: "Ubicaciones y coordenadas GPS",
            icono: "map.fill",
            ruta: .mapa
        ),
        MenuItemTurismo(
            nombre: "Estadísticas",
            descripcion: "Afluencia turística mundial",
            icono: "chart.bar.fill",
            ruta: .estadisticas
        ),
        MenuItemTurismo(
            nombre: "Destinos PA1",
            descripcion: "Catálogo original de destinos",
            icono: "sparkles",
            ruta: .destinosPopulares
        )
    ]
}

struct DashboardView: View {
    @Environment(AppRouter.self) private var router
    
    var body: some View {
        let items = MenuItemTurismo.menuItems
        let columnas = [
            GridItem(.flexible(), spacing: 14),
            GridItem(.flexible(), spacing: 14)
        ]
        
        ScrollView {
            VStack(spacing: 16) {
                // Banner superior de Turismo Flylo
                ZStack(alignment: .bottomLeading) {
                    RemoteImageView(
                        urlString: "https://images.unsplash.com/photo-1526392060635-9d6019884377?w=1000&auto=format&fit=crop&q=80",
                        contentMode: .fill
                    )
                    .frame(height: 220)
                    .clipped()
                    
                    LinearGradient(
                        colors: [.clear, Color.black.opacity(0.4), Color.black.opacity(0.85)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Flylo Turismo")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(AppColors.primary)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                        
                        Text("Panel Turístico")
                            .font(AppTypography.title)
                            .foregroundColor(.white)
                        
                        Text("Selecciona una opción para comenzar a explorar")
                            .font(AppTypography.caption)
                            .foregroundColor(.white.opacity(0.85))
                    }
                    .padding(AppDimens.Spacing.medium)
                }
                .clipShape(RoundedRectangle(cornerRadius: AppDimens.Radius.large))
                .padding(.horizontal, 16)
                .padding(.top, 10)
                
                // Cuadrícula de opciones
                LazyVGrid(columns: columnas, alignment: .center, spacing: 14) {
                    ForEach(items) { item in
                        Button {
                            seleccionarOpcion(for: item)
                        } label: {
                            MenuCardTurismoView(item: item)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Flylo")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func seleccionarOpcion(for item: MenuItemTurismo) {
        if let ruta = item.ruta {
            router.navigate(to: ruta)
        }
    }
}

struct MenuCardTurismoView: View {
    let item: MenuItemTurismo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack {
                Circle()
                    .fill(AppColors.primaryLight)
                    .frame(width: 52, height: 52)
                
                Image(systemName: item.icono)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(AppColors.primary)
            }
            
            Text(item.nombre)
                .font(AppTypography.title3)
                .foregroundStyle(AppColors.secondary)
                .lineLimit(1)
                .minimumScaleFactor(0.85)
            
            Text(item.descripcion)
                .font(AppTypography.caption)
                .foregroundStyle(AppColors.textSecondary)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, minHeight: 145, alignment: .topLeading)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: AppDimens.Radius.medium)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 3)
        )
    }
}

#Preview {
    NavigationStack {
        DashboardView()
            .environment(AppRouter())
    }
}
