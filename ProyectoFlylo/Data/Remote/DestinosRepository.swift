//
//  DestinosRepository.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import Foundation

struct DestinosRepository {
    func listDestinos() async throws -> [Destino] {
        try await ApiClient.get("destino.php")
    }
}
