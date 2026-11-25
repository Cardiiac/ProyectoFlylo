//
//  EstadisticaTurismo.swift
//  ProyectoFlylo
//

import Foundation

struct EstadisticaTurismo: Codable, Identifiable, Hashable {
    let id: Int
    let destino: String
    let pais: String
    let visitantes: Double
    let etiqueta: String
}
