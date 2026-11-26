//
//  GaleriaRepository.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import Foundation

struct GaleriaRepository {
    func listGaleria() async throws -> [DestinoGaleria] {
        try await ApiClient.get("galeria.php")
    }
}
