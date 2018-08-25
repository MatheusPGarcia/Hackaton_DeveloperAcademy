//
//  Doctor.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 24/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import Foundation

struct Doctor: Codable {

    let doctorId: String
    let name: String
    let age: Int
    let crm: String
    // specialist
    var offices: [Office]
    // healthInsurance
    var appointments: [Appointment]
    var doctorRatings: [DoctorRating]

    init(_ doctorId: String, _ name: String, _ age: Int, _ crm: String) {
        self.doctorId = doctorId
        self.name = name
        self.age = age
        self.crm = crm

        offices = []
        appointments = []
        doctorRatings = []
    }
}

extension Doctor {
    enum StructKeys: String, CodingKey {
        case doctorId
        case name
        case age
        case crm
        case offices
        case appointments
        case doctorRatings
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StructKeys.self)

        let doctorId: String = try container.decode(String.self, forKey: .doctorId)
        let name: String = try container.decode(String.self, forKey: .name)
        let age: Int = try container.decode(Int.self, forKey: .age)
        let crm: String = try container.decode(String.self, forKey: .crm)
        let offices: [Office] = try container.decode([Office].self, forKey: .offices)
        let appointments: [Appointment] = try container.decode([Appointment], forKey: .appointments)
        let doctorRatings: [DoctorRating] = try container.decode([DoctorRating], forKey: .doctorRatings)

        self.doctorId = doctorId
        self.name = name
        self.age = age
        self.crm = crm
        self.offices = offices
        self.appointments = appointments
        self.doctorRatings = doctorRatings
    }
}
