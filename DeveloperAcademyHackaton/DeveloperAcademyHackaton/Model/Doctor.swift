//
//  Doctor.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 24/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import Foundation

class Doctor {

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
