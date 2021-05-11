//
//  ImageAnalyzer.swift
//  WhatAmIEating
//
//  Created by Peterses on 09/04/2021.
//

import Foundation
import UIKit
import Vision

class ImageAnalyzer {
    
    private let searchingRegex = "E ?\\d{3,4}[a-f]?"
    
    func recognizeText(image: UIImage?) -> String {
        guard let cgImage = image?.cgImage else {
            return "No image found!"
        }
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        var text: String = ""
        
        let request = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation], error == nil else {
                print(error?.localizedDescription ?? "error")
                return
            }
            
            text = observations.compactMap({
                $0.topCandidates(1).first?.string
            }).joined(separator: " ")
            
        }
        
        do {
            try handler.perform([request])
        } catch  {
            print(error)
        }
        return text
    }
    
    func findESymbolsRegex(text: String) -> [String] {
        var eNumbers: [String] = []
        let range = NSRange(location: 0, length: text.utf16.count)
        let regex = try! NSRegularExpression(pattern: searchingRegex)

        regex.firstMatch(in: text, options: [], range: range) != nil
        
        let result = regex.matches(in: text, options: [], range: range)
        
        result.map {
            eNumbers.append(String(text[Range($0.range, in: text)!]))
        }
        
        return eNumbers
    }
}
