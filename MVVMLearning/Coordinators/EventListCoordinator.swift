//
//  EventListCoordinator.swift
//  MVVMLearning
//
//  Created by Haidar Bhatti on 17/02/2023.
//

import Foundation
import UIKit

final class EventListCoordinator: Coordinator{
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start(){
        let eventListController: EventListViewController = .instantiate()
        let viewModel = EventListViewModel()
        viewModel.coordinator = self
        eventListController.viewModel = viewModel
        navigationController.setViewControllers([eventListController], animated: false)
    }
    
    func startAddEvent(){
        let addEventCoordinator = AddEventCoordinator(navigationController: navigationController)
        childCoordinators.append(addEventCoordinator)
        addEventCoordinator.parentCoordinator = self
        addEventCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator){
        if let index = childCoordinators.firstIndex(where: { coordinator in
            return childCoordinator === coordinator
        }){
            childCoordinators.remove(at: index)
        }
    }
    
}
