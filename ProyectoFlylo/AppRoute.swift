//
//  AppRoute.swift
//  ProyectoFlylo
//  Sistema de navegación y AppRouter desacoplado idéntico a ProyectoLoki
//

import SwiftUI

enum AppRoute: Hashable {
    case bienvenida
    case login
    case dashboard
    case categorias
    case atractivos(categoria: CategoriaTour)
    case atractivodetalle(atractivo: Atractivo)
    case galeria
    case mapa
    case estadisticas
    case destinosPopulares
}

@Observable
final class AppRouter {
    public var path: NavigationPath = NavigationPath()
    
    public init() {}
    
    public func navigate(to route: AppRoute) {
        path.append(route)
    }
    
    public func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    public func popToRoot() {
        path = NavigationPath()
    }
}
