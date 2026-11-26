//
//  EstadisticasViewModel.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import Foundation

@Observable
class EstadisticasViewModel {
    var estado: LoadState<[EstadisticaTurismo]> = .loading
    private let repository = EstadisticasRepository()
    
    func getEstadisticas() async {
        estado = .loading
        do {
            let datos = try await repository.listEstadisticas()
            estado = .loaded(datos)
        } catch {
            estado = .failed(error.localizedDescription)
        }
    }
}
