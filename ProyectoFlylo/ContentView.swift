//
//  ContentView.swift
//  ProyectoFlylo
//  Navegación central desacoplada idéntica a ContentView de ProyectoLoki
//

import SwiftUI

struct ContentView: View {
    @State private var router = AppRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            BienvenidaView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .bienvenida:
                        BienvenidaView()
                    case .login:
                        LoginView()
                    case .dashboard:
                        DashboardView()
                    case .categorias:
                        CategoriasView()
                    case .atractivos(let categoria):
                        AtractivosView(categoria: categoria)
                    case .atractivodetalle(let atractivo):
                        AtractivoDetalleView(atractivo: atractivo)
                    case .galeria:
                        GaleriaView()
                    case .mapa:
                        MapaView()
                    case .estadisticas:
                        EstadisticasView()
                    case .destinosPopulares:
                        DestinosPopularesView()
                    }
                }
        }
        .environment(router)
        .tint(AppColors.primary)
    }
}

#Preview {
    ContentView()
}
