//
//  String_html.swift
//  ProyectoFlylo
//
//  Created by user301904 on 11/25/26.
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
