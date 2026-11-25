//
//  DestinoGaleria.swift
//  ProyectoFlylo
//

import Foundation

struct DestinoGaleria: Codable, Identifiable, Hashable {
    let id: Int
    let titulo: String
    let subtitulo: String
    let descripcion: String
    let foto: String
    let pais: String
}
