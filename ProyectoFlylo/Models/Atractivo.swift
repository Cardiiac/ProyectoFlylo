//
//  Atractivo.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import Foundation

struct Atractivo: Codable, Identifiable, Hashable {
    let idatractivo: Int
    let idcategoria: Int
    let nombre: String
    let pais: String
    let ciudad: String
    let valoracion: Double
    let duracion: String
    let imagenchica: String
    let imagengrande: String?
    let precioguia: Double?
    let unidadesenexistencia: Int?
    let detalle: String?
    let descripcion: String?
    let mejor_epoca: String?
    let clima: String?
    let altitud: String?
    
    var id: Int { idatractivo }
}
