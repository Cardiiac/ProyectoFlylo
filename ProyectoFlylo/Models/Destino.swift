//
//  Destino.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import Foundation

struct Destino: Codable, Identifiable, Hashable {
    let destino_id: Int
    let pais: String
    let lugar: String
    let descripcion: String
    let precio: String
    let detalle: String
    let img: String

    var id: Int { destino_id }
}
