//
//  Appointment.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 24/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import Foundation

struct Appointment: Codable {
    let user: User
    let doctor: Doctor
    let office: Office

    init(_ user: User, _ doctor: Doctor, _ office: Office) {
        self.user = user
        self.doctor = doctor
        self.office = office
    }
}

extension Appointment {

    enum StructKeys: String, CodingKey {
        case user
        case doctor
        case office
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StructKeys.self)

        let user: User = try container.decode(User.self, forKey: .user)
        let doctor: Doctor = try container.decode(Doctor.self, forKey: .doctor)
        let office: Office = try container.decode(Office.self, forKey: .office)

        self.user = user
        self.doctor = doctor
        self.office = office
    }
}
