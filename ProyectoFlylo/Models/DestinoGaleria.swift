//
//  DestinoGaleria.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
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
