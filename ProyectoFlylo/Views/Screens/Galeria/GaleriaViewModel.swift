//
//  GaleriaViewModel.swift
//  ProyectoFlylo
//  Idéntico a EmpleadosViewModel de ProyectoLoki
//

import Foundation

@Observable
class GaleriaViewModel {
    var estado: LoadState<[DestinoGaleria]> = .loading
    private let repository = GaleriaRepository()
    
    func getGaleria() async {
        estado = .loading
        do {
            let destinos = try await repository.listGaleria()
            estado = .loaded(destinos)
        } catch {
            estado = .failed(error.localizedDescription)
        }
    }
}
