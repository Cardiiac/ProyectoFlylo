//
//  MapaRepository.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import Foundation

struct MapaRepository {
    func listPuntos() async throws -> [PuntoMapa] {
        try await ApiClient.get("mapa.php")
    }
}
