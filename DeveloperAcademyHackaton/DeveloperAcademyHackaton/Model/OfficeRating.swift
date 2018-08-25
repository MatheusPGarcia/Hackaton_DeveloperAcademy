//
//  OfficeRating.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 24/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import Foundation

struct OfficeRating: Codable {

    var quality: Double
    var waitingTime: Double
    var price: Double
    var cleaning: Double
    var comments: [String]

    init(_ quality: Double, _ waitingTime: Double, _ price: Double, _ cleaning: Double) {
        self.quality = quality
        self.waitingTime = waitingTime
        self.price = price
        self.cleaning = cleaning

        self.comments = []
    }
}

extension OfficeRating {
    enum StructKeys: String, CodingKey {
        case quality
        case waitingTime
        case price
        case cleaning
        case comments
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StructKeys.self)

        let quality: Double = try container.decode(Double.self, forKey: .quality)
        let waitingTime: Double = try container.decode(Double.self, forKey: .waitingTime)
        let price: Double = try container.decode(Double.self, forKey: .price)
        let cleaning: Double = try container.decode(Double.self, forKey: .quality)
        let comments: [String] = try container.decode([String].self, forKey: .comments)

        self.quality = quality
        self.waitingTime = waitingTime
        self.price = price
        self.cleaning = cleaning
        self.comments = comments
    }
}
