//
//  AtractivosViewModel.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import Foundation

@Observable
class AtractivosViewModel {
    var estado: LoadState<[Atractivo]> = .loading
    private let repository = ToursRepository.shared
    
    func getAtractivos(idCategoria: Int) async {
        estado = .loading
        do {
            let atractivos = try await repository.fetchAtractivos(idCategoria: idCategoria)
            estado = .loaded(atractivos)
        } catch {
            estado = .failed(error.localizedDescription)
        }
    }
}
