//
//  AtractivoDetalleViewModel.swift
//  ProyectoFlylo
//  Idéntico a ProductoDetalleViewModel de ProyectoLoki
//

import Foundation

@Observable
class AtractivoDetalleViewModel {
    var estado: LoadState<[Atractivo]> = .loading
    private let repository = ToursRepository.shared
    
    func getAtractivoDetalle(idAtractivo: Int) async {
        estado = .loading
        do {
            let items = try await repository.fetchAtractivoDetalle(idAtractivo: idAtractivo)
            estado = .loaded(items)
        } catch {
            estado = .failed(error.localizedDescription)
        }
    }
}
