//
//  AtractivoDetalleViewModel.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
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
