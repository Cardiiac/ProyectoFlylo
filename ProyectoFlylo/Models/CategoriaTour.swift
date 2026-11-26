//
//  CategoriaTour.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import Foundation

struct CategoriaTour: Codable, Identifiable, Hashable {
    let idcategoria: Int
    let nombre: String
    let descripcion: String
    let foto: String
    let total: Int
    
    var id: Int { idcategoria }
}
