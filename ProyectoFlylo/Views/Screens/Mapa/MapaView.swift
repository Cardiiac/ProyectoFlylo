//
//  MapaView.swift
//  ProyectoFlylo
//  Requisito PA4: Mapa con marcadores (lat, long, etiqueta) desde servicio web (MapKit)
//

import SwiftUI
import MapKit

struct MapaView: View {
    @State private var viewModel = MapaViewModel()
    
    var body: some View {
        Group {
            switch viewModel.estado {
            case .loading:
                ProgressView("Cargando ubicaciones turísticas...")
                    .scaleEffect(1.3)
                    .tint(AppColors.primary)
            case .failed(let mensaje):
                ContentUnavailableView(
                    "Error al cargar mapa",
                    systemImage: "map.triangle.fill",
                    description: Text(mensaje)
                )
            case .loaded(let puntos):
                ZStack(alignment: .bottom) {
                    // Mapa interactivo nativo de SwiftUI
                    Map(position: $viewModel.position) {
                        ForEach(puntos) { punto in
                            Marker(punto.nombre, coordinate: punto.coordenada)
                                .tint(AppColors.primary)
                        }
                    }
                    .mapControls {
                        MapCompass()
                        MapScaleView()
                    }
                    .ignoresSafeArea(edges: .bottom)
                    
                    // Carrusel inferior de tarjetas para explorar y saltar a marcadores
                    VStack(spacing: 10) {
                        if let seleccionado = viewModel.puntoSeleccionado {
                            PuntoMapaCardView(punto: seleccionado)
                                .padding(.horizontal, 16)
                                .transition(.slide.combined(with: .opacity))
                        }
                        
                        // Selector horizontal de puntos
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(puntos) { punto in
                                    Button {
                                        withAnimation(.easeInOut) {
                                            viewModel.enfocarPunto(punto)
                                        }
                                    } label: {
                                        HStack(spacing: 6) {
                                            Image(systemName: "mappin.circle.fill")
                                                .foregroundStyle(viewModel.puntoSeleccionado?.id == punto.id ? .white : AppColors.primary)
                                            Text(punto.nombre)
                                                .font(.caption)
                                                .fontWeight(.semibold)
                                                .foregroundColor(viewModel.puntoSeleccionado?.id == punto.id ? .white : AppColors.secondary)
                                        }
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
                                        .background(
                                            Capsule()
                                                .fill(viewModel.puntoSeleccionado?.id == punto.id ? AppColors.primary : Color.white)
                                                .shadow(color: Color.black.opacity(0.1), radius: 4, y: 2)
                                        )
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                        .padding(.bottom, 20)
                    }
                }
            }
        }
        .navigationTitle("Mapa Turístico")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.getPuntos()
        }
    }
}

#Preview {
    NavigationStack {
        MapaView()
    }
}
