//
//  AtractivoDetalleView.swift
//  ProyectoFlylo
//  Pantalla 3 del Maestro-Detalle - Idéntica a ProductoDetalleView de ProyectoLoki
//

import SwiftUI

struct AtractivoDetalleView: View {
    let atractivo: Atractivo
    @State private var viewModel = AtractivoDetalleViewModel()
    
    var body: some View {
        Group {
            switch viewModel.estado {
            case .loading:
                ProgressView("Cargando detalle del destino...")
                    .scaleEffect(1.3)
                    .tint(AppColors.primary)
            case .failed(let mensaje):
                ContentUnavailableView {
                    Label("Error", systemImage: "exclamationmark.triangle")
                } description: {
                    Text(mensaje)
                }
            case .loaded(let items):
                ScrollView {
                    if let itemDetalle = items.first {
                        AtractivoDetalleItemView(atractivo: itemDetalle)
                    } else {
                        AtractivoDetalleItemView(atractivo: atractivo)
                    }
                }
            }
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle(atractivo.nombre)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.getAtractivoDetalle(idAtractivo: atractivo.id)
        }
    }
}

#Preview {
    NavigationStack {
        AtractivoDetalleView(atractivo: Atractivo(
            idatractivo: 1,
            idcategoria: 1,
            nombre: "Machu Picchu",
            pais: "Perú",
            ciudad: "Cusco",
            valoracion: 4.9,
            duracion: "Día completo",
            imagenchica: "",
            imagengrande: nil,
            precioguia: 45,
            unidadesenexistencia: 500,
            detalle: "Ciudadela inca",
            descripcion: "Maravilla del mundo",
            mejor_epoca: "Mayo a Octubre",
            clima: "Templado",
            altitud: "2430m"
        ))
    }
}
