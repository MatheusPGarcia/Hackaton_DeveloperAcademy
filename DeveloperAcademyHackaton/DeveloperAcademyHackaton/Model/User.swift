//
//  User.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 24/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import Foundation

struct User: Codable {

    let userId: String
    let name: String
    let cpf: String
    let userRg: String
    // health Insurance
    var appointments: [Appointment]
    var saveDoctors: [Doctor]
    var address: Address
    var doctorRatings: [DoctorRating]
    var officeRatings: [OfficeRating]

    init(_ userId: String, _ name: String, _ cpf: String, _ userRg: String, _ address: Address) {

        self.userId = userId
        self.name = name
        self.cpf = cpf
        self.userRg = userRg
        self.address = address

        appointments = []
        saveDoctors = []
        doctorRatings = []
        officeRatings = []
    }
}

extension User {
    enum StructKeys: String, CodingKey {
        case userId
        case name
        case cpf
        case userRg
        case appointments
        case saveDoctors
        case address
        case doctorRating
        case officeRatings
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StructKeys.self)

        let userId: String = try container.decode(String.self, forKey: .userId)
        let name: String = try container.decode(String.self, forKey: .name)
        let cpf: String = try container.decode(String.self, forKey: .cpf)
        let userRg: String = try container.decode(String.self, forKey: .userRg)
        let appointments: [Appointment] = try container.decode([Appointment].self, forKey: .appointments)
        let saveDoctors: [Doctor] = try container.decode([Doctor].self, forKey: .saveDoctors)
        let address: Address = try container.decode(Address.self, forKey: .address)
        let doctorRating: [DoctorRating] = try container.decode([DoctorRating].self, forKey: .doctorRating)
        let officeRating: [OfficeRating] = try container.decode([OfficeRating].self, forKey: .officeRatings)

        self.userId = userId
        self.name = name
        self.cpf = cpf
        self.userRg = userRg
        self.appointments = appointments
        self.saveDoctors = saveDoctors
        self.address = address
        self.doctorRatings = doctorRating
        self.officeRatings = officeRating
    }
}
