//
//  TitleSubtitleCell.swift
//  MVVMLearning
//
//  Created by Haidar Bhatti on 20/02/2023.
//

import UIKit

class TitleSubtitleCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtSubTitle: UITextField!

    func update(with viewModel: TitleSubtitleCellViewModel){
        lblTitle.text = viewModel.title
        txtSubTitle.text = viewModel.subTitle
        txtSubTitle.placeholder = viewModel.placeholder
    }
    
}
