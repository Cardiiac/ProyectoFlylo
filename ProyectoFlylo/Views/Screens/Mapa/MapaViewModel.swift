//
//  MapaViewModel.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import Foundation
import SwiftUI
import MapKit

@Observable
class MapaViewModel {
    var estado: LoadState<[PuntoMapa]> = .loading
    private let repository = MapaRepository()
    
    // Posición inicial del mapa centrada en el mundo o en el primer punto
    var position: MapCameraPosition = .automatic
    var puntoSeleccionado: PuntoMapa?
    
    func getPuntos() async {
        estado = .loading
        do {
            let puntos = try await repository.listPuntos()
            estado = .loaded(puntos)
            if let primero = puntos.first {
                puntoSeleccionado = primero
                position = .region(MKCoordinateRegion(
                    center: primero.coordenada,
                    span: MKCoordinateSpan(latitudeDelta: 15.0, longitudeDelta: 15.0)
                ))
            }
        } catch {
            estado = .failed(error.localizedDescription)
        }
    }
    
    func enfocarPunto(_ punto: PuntoMapa) {
        puntoSeleccionado = punto
        position = .region(MKCoordinateRegion(
            center: punto.coordenada,
            span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        ))
    }
}
