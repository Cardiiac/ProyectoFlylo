//
//  GaleriaRepository.swift
//  ProyectoFlylo
//  Estructura idéntica a EmpleadosRepository de ProyectoLoki
//

import Foundation

struct GaleriaRepository {
    func listGaleria() async throws -> [DestinoGaleria] {
        try await ApiClient.get("galeria.php")
    }
}
