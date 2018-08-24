//
//  User.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 24/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import Foundation

class User {

    let userId: String
    let name: String
    let cpf: String
    let userRg: String
    // health Insurance
    var appointments: [Appointment]
    var saveDoctors: [Doctor]
    var address: String
    var doctorRatings: [DoctorRating]
    var officeRatings: [OfficeRating]

    init(_ userId: String, _ name: String, _ cpf: String, _ userRg: String, _ address: String) {

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

    func defineUserAppointments(appointments: [Appointment]) {
        self.appointments = appointments
    }

    func defineFavoritesDoctors(_ favorites: [Doctor]) {
        self.saveDoctors = favorites
    }

    func defineRatings(forDoctors doctors: [DoctorRating], forOffice offices: [OfficeRating]) {
        self.doctorRatings = doctors
        self.officeRatings = offices
    }
}
