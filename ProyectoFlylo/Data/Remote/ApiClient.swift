//
//  ApiClient.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
//
import Foundation

enum ApiClient {
    static func get<T: Decodable>(_ recurso: String) async throws -> [T] {
        guard let url = URL(string: AppConfig.API_URL + recurso) else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([T].self, from: data)
    }
}
