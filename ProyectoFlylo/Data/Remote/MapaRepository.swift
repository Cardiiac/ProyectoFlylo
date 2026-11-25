//
//  MapaRepository.swift
//  ProyectoFlylo
//  Estructura idéntica a OficinasRepository de ProyectoLoki
//

import Foundation

struct MapaRepository {
    func listPuntos() async throws -> [PuntoMapa] {
        try await ApiClient.get("mapa.php")
    }
}
