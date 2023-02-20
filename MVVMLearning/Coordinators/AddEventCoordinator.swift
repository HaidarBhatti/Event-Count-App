//
//  AddEventCoordinator.swift
//  MVVMLearning
//
//  Created by Haidar Bhatti on 17/02/2023.
//

import UIKit

final class AddEventCoordinator: Coordinator{
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    var parentCoordinator: EventListCoordinator?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let addEventViewController: AddEventViewController = .instantiate()
        let viewModel = AddEventViewModel()
        viewModel.coordinator = self
        addEventViewController.viewModel = viewModel
        navigationController.present(addEventViewController, animated: true)
    }
    
    func didFinishAddEvent() {
        parentCoordinator?.childDidFinish(self)
    }
}
