//
//  EventListViewController.swift
//  MVVMLearning
//
//  Created by Haidar Bhatti on 17/02/2023.
//

import UIKit

final class EventListViewController: UIViewController {
        
    var viewModel: EventListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews(){
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(plusTapped))
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func plusTapped(){
        viewModel.onTapAddEvent()
    }

}
