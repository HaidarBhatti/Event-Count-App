//
//  EventListViewModel.swift
//  MVVMLearning
//
//  Created by Haidar Bhatti on 17/02/2023.
//

import Foundation

final class EventListViewModel{
        
    let title = "Events"
    var coordinator: EventListCoordinator?

    func onTapAddEvent(){
        coordinator?.startAddEvent()
    }
}
