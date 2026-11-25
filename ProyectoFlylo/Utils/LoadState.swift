//
//  LoadState.swift
//  ProyectoFlylo
//
//  Created for PA4 - Flylo Turismo
//

import Foundation

enum LoadState<T> {
    case loading
    case loaded(T)
    case failed(String)
}
