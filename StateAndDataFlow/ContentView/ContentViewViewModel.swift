//
//  ContentViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import Observation
import Foundation

final class ContentViewViewModel: Observable {
    @Published var counter: Int = 3
    @Published var buttonTitle: String = "Start"

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

