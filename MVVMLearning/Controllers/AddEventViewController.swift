//
//  AddEventViewController.swift
//  MVVMLearning
//
//  Created by Haidar Bhatti on 17/02/2023.
//

import UIKit

final class AddEventViewController: UIViewController {

    var viewModel: AddEventViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDisappear()
    }

}
