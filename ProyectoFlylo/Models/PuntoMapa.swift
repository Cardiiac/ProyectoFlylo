//
//  PuntoMapa.swift
//  ProyectoFlylo
//

import Foundation
import CoreLocation

struct PuntoMapa: Codable, Identifiable, Hashable {
    let id: Int
    let nombre: String
    let direccion: String
    let ciudad: String
    let pais: String
    let telefono: String
    let latitud: Double
    let longitud: Double
    let tipo: String
    
    var coordenada: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
    }
}
