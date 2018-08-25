//
//  Address.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 24/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import Foundation

struct Address: Codable {
    var street: String
    var number: String
    var complement: String?
    var zipCode: String
    var latitude: String
    var longitude: String
    var region: String

    init(_ street: String, _ number: String, _ complement: String? = nil, _ zipCode: String, _ latitude: String, _  longitude: String, _ region: String) {
        self.street = street
        self.number = number
        self.complement = complement
        self.zipCode = zipCode
        self.latitude = latitude
        self.longitude = longitude
        self.region = region
    }
}

extension Address {

    enum StructKeys: String, CodingKey {
        case street
        case number
        case complement
        case zipCode
        case latitude
        case longitude
        case region
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StructKeys.self)

        let street: String = try container.decode(String.self, forKey: .street)
        let number: String = try container.decode(String.self, forKey: .number)
        let complement: String = try container.decode(String.self, forKey: .complement)
        let zipCode: String = try container.decode(String.self, forKey: .zipCode)
        let latitude: String = try container.decode(String.self, forKey: .latitude)
        let longitude: String = try container.decode(String.self, forKey: .longitude)
        let region: String = try container.decode(String.self, forKey: .region)

        self.street = street
        self.number = number
        self.complement = complement
        self.zipCode = zipCode
        self.latitude = latitude
        self.longitude = longitude
        self.region = region
    }
}
