//
//  DestinosPopularesViewModel.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
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
