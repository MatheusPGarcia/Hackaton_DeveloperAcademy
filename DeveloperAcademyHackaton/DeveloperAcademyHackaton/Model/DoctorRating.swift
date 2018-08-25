//
//  DoctorRating.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 24/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import Foundation

struct DoctorRating: Codable {

    let quality: Double
    let waitingTime: Double
    let price: Double
    let friendliness: Double
    let comments: [String]

    init(_ quality: Double, _ waitingTime: Double, _ price: Double, _ friendliness: Double) {
        self.quality = quality
        self.waitingTime = waitingTime
        self.price = price
        self.friendliness = friendliness

        comments = []
    }
}

extension DoctorRating {
    enum StructKeys: String, CodingKey {
        case quality
        case waitingTime
        case price
        case friendliness
        case comments
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StructKeys.self)

        let quality: Double = try container.decode(Double.self, forKey: .quality)
        let waitingTime: Double = try container.decode(Double.self, forKey: .waitingTime)
        let price: Double = try container.decode(Double.self, forKey: .price)
        let friendliness: Double = try container.decode(Double.self, forKey: .friendliness)
        let comments: [String] = try container.decode([String].self, forKey: .comments)

        self.quality = quality
        self.waitingTime = waitingTime
        self.price = price
        self.friendliness = friendliness
        self.comments = comments
    }
}
