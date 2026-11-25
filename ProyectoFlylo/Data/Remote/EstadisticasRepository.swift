//
//  EstadisticasRepository.swift
//  ProyectoFlylo
//

import Foundation

struct EstadisticasRepository {
    func listEstadisticas() async throws -> [EstadisticaTurismo] {
        try await ApiClient.get("estadisticas.php")
    }
}
