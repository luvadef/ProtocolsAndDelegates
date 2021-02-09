//
//  main.swift
//  Protocols and Delegates
//
//  Created by Luis Valdes on 09-02-21.
//
protocol AdvanceLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvanceLifeSupport?
    
    func assessSituation(){
        print("Can you tell me what happened?")
    }
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvanceLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor: AdvanceLifeSupport{
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("The doctor does chest compressions, 30 per second.")
    }
    func useStethescope() {
        print("Listening for heart sounds.")
    }
}

class Surgeon: Doctor{
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees.")
    }
    func useElectricDrill() {
        print("Whirrr...")
    }
}

let emilio = EmergencyCallHandler()
let pete = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()

