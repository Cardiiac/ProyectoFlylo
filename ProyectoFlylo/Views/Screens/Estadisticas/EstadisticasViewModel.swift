//
//  EstadisticasViewModel.swift
//  ProyectoFlylo
//  ViewModel para Gráfico de Barras con datos de servicio web
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
