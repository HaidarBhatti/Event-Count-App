//
//  AddEventViewModel.swift
//  MVVMLearning
//
//  Created by Haidar Bhatti on 17/02/2023.
//

import Foundation

final class AddEventViewModel{
    
    let title = "Add"
    var onUpdate: () -> () = {}

    enum Cell{
        case titleSubject(TitleSubtitleCellViewModel)
        case titleImage
    }
    
    var cells: [Cell] = []
    var coordinator: AddEventCoordinator?
    func viewDidLoad(){
        cells = [.titleSubject(TitleSubtitleCellViewModel(title: "Name", subTitle: "", placeholder: "Add your name")),                           .titleSubject(TitleSubtitleCellViewModel(title: "Date", subTitle: "", placeholder: "Enter a Date"))]
        onUpdate()
    }
    
    func viewDisappear(){
        coordinator?.didFinishAddEvent()
    }
    
    func numberOfRows() -> Int{
        return cells.count
    }
    
    func cell(for indexPath: IndexPath) -> Cell{
        return cells[indexPath.row]
    }
    
    func onTappedDoneBtn(_ index: IndexPath){
        print("on Tapped Done Btn")
    }
    
    func onTappedCloseBtn(){
        print("on Tapped close Btn")
    }
    
    func updateCell(indexPath: IndexPath, subTitle: String){
        switch cells[indexPath.row]{
        case .titleSubject(let titleSubtitleCellViewModel):
            titleSubtitleCellViewModel.update(subTitle: subTitle)
        case .titleImage:
            break
        }
    }
    
}
