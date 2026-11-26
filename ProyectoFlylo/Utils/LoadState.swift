//
//  LoadState.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import Foundation

enum LoadState<T> {
    case loading
    case loaded(T)
    case failed(String)
}
