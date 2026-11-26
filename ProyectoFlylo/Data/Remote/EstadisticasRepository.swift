//
//  EstadisticasRepository.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import Foundation

struct EstadisticasRepository {
    func listEstadisticas() async throws -> [EstadisticaTurismo] {
        try await ApiClient.get("estadisticas.php")
    }
}
