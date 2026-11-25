//
//  String_html.swift
//  ProyectoFlylo
//
//  Created for PA4 - Flylo Turismo
//

import Foundation

extension String {
    var htmlToPlainText: String {
        guard let data = self.data(using: .utf8) else { return self }
        do {
            let attributed = try NSAttributedString(
                data: data,
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil
            )
            return attributed.string.trimmingCharacters(in: .whitespacesAndNewlines)
        } catch {
            return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        }
    }
}
