//
//  DestinosRepository.swift
//  ProyectoFlylo
//

import Foundation

struct DestinosRepository {
    func listDestinos() async throws -> [Destino] {
        try await ApiClient.get("destino.php")
    }
}
