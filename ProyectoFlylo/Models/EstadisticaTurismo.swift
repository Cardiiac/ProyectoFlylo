//
//  EstadisticaTurismo.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import Foundation

struct EstadisticaTurismo: Codable, Identifiable, Hashable {
    let id: Int
    let destino: String
    let pais: String
    let visitantes: Double
    let etiqueta: String
}
