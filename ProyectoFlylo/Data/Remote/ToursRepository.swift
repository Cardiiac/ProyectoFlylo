//
//  ToursRepository.swift
//  ProyectoFlylo
//  Implementación idéntica a TiendaRepository de ProyectoLoki
//

import Foundation

struct ToursRepository {
    static let shared = ToursRepository()
    
    func listCategorias() async throws -> [CategoriaTour] {
        try await ApiClient.get("categorias.php")
    }
    
    func fetchAtractivos(idCategoria: Int) async throws -> [Atractivo] {
        var components = URLComponents(string: "atractivos.php")
        components?.queryItems = [
            URLQueryItem(name: "idcategoria", value: String(idCategoria))
        ]
        guard let path = components?.string else {
            throw URLError(.badURL)
        }
        return try await ApiClient.get(path)
    }
    
    func fetchAtractivoDetalle(idAtractivo: Int) async throws -> [Atractivo] {
        var components = URLComponents(string: "atractivos.php")
        components?.queryItems = [
            URLQueryItem(name: "idatractivo", value: String(idAtractivo))
        ]
        guard let path = components?.string else {
            throw URLError(.badURL)
        }
        return try await ApiClient.get(path)
    }
}
