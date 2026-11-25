//
//  CategoriasViewModel.swift
//  ProyectoFlylo
//  Patrón idéntico a TiendaViewModel de ProyectoLoki
//

import Foundation

@Observable
class CategoriasViewModel {
    var estado: LoadState<[CategoriaTour]> = .loading
    private let repository = ToursRepository.shared
    
    func getCategorias() async {
        estado = .loading
        do {
            let categorias = try await repository.listCategorias()
            estado = .loaded(categorias)
        } catch {
            estado = .failed(error.localizedDescription)
        }
    }
}
