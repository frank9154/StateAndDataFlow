//
//  ContentViewViewModel.swift
//  StateAndDataFlow
//
//
//

import Observation
import Foundation

@Observable
final class ContentViewViewModel {
    var counter: Int = 3
    var buttonTitle: String = "Start"

    private var timer: Timer?

    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                withTimeInterval: 1,
                repeats: true
            ) { [weak self] _ in
                self?.updateCounter()
            }
        }
        
        buttonDidTapped()
    }

    private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
    }
}

