//
//  TitleSubtitleCellViewModel.swift
//  MVVMLearning
//
//  Created by Haidar Bhatti on 20/02/2023.
//
class TitleSubtitleCellViewModel{
    let title: String
    private(set) var subTitle: String
    let placeholder: String
    
    init(title: String, subTitle: String, placeholder: String){
        self.title = title
        self.subTitle = subTitle
        self.placeholder = placeholder
    }
    
    func update(subTitle: String){
        self.subTitle = subTitle
    }
}
