//
//  AppCoordinator.swift
//  MVVMLearning
//
//  Created by Haidar Bhatti on 16/02/2023.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject{
    var childCoordinators: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator{
    
    private(set) var childCoordinators: [Coordinator] = []
    
    private var window: UIWindow
    
    init(window: UIWindow){
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        let eventListCoordinate = EventListCoordinator(navigationController: navigationController)
        eventListCoordinate.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    
}
