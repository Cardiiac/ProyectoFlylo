//
//  GaleriaViewModel.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
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
