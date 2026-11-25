//
//  String_html.swift
//  ProyectoFlylo
//  Implementación idéntica a ProyectoLoki con soporte completo para UIKit
//

import SwiftUI
import Foundation
import UIKit

extension String {
    var htmlToPlainText: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func htmlToAttributedString() -> AttributedString {
        let adjustedHTML = self
            .replacingOccurrences(of: "</p>", with: "</p><br>")
            .replacingOccurrences(of: "<ul>", with: "<br><ul>")
        
        guard let data = adjustedHTML.data(using: .utf8) else {
            return AttributedString(self)
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        do {
            let nsAttributedString = try NSAttributedString(data: data, options: options, documentAttributes: nil)
            var attributedString = try AttributedString(nsAttributedString, including: \.uiKit)
            attributedString.font = .body
            attributedString.foregroundColor = .primary
            return attributedString
        } catch {
            return AttributedString(self)
        }
    }
}
