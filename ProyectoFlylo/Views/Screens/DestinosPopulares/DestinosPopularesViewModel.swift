//
//  DestinosPopularesViewModel.swift
//  ProyectoFlylo
//  Integración del servicio de la PA1 con arquitectura moderna
//

import Foundation

@Observable
class DestinosPopularesViewModel {
    var estado: LoadState<[Destino]> = .loading
    private let repository = DestinosRepository()
    
    func getDestinos() async {
        estado = .loading
        do {
            let items = try await repository.listDestinos()
            estado = .loaded(items)
        } catch {
            estado = .failed(error.localizedDescription)
        }
    }
}
