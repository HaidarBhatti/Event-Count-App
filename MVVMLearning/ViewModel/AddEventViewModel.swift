//
//  AddEventViewModel.swift
//  MVVMLearning
//
//  Created by Haidar Bhatti on 17/02/2023.
//

import Foundation

final class AddEventViewModel{
    
    var coordinator: AddEventCoordinator?
    
    func viewDisappear(){
        coordinator?.didFinishAddEvent()
    }
    
}
