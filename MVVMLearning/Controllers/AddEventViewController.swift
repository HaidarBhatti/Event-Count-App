//
//  AddEventViewController.swift
//  MVVMLearning
//
//  Created by Haidar Bhatti on 17/02/2023.
//

import UIKit

final class AddEventViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: AddEventViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDisappear()
    }
    
    func setUpViews(){
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TitleSubtitleCell", bundle: nil), forCellReuseIdentifier: "TitleSubtitleCell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(onTapDone))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(onTapClose))
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.setContentOffset(CGPoint(x: 0, y: -1), animated: false)
    }
    @objc private func onTapDone(_ sender: UIButton){
//        viewModel.onTappedDoneBtn(<#T##index: IndexPath##IndexPath#>)
    }
    @objc private func onTapClose(_ sender: UIButton){
        viewModel.onTappedCloseBtn()
    }
}

extension AddEventViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cell(for: indexPath)
        switch cellViewModel{
        case .titleSubject(let titleSubtitleCellViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleSubtitleCell", for: indexPath) as! TitleSubtitleCell
            cell.update(with: titleSubtitleCellViewModel)
            cell.txtSubTitle.delegate = self
            return cell
        case .titleImage:
            return UITableViewCell()
        }
    }
}

extension AddEventViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else { return false }
        let text = currentText + string
        let point = textField.convert(textField.bounds.origin, to: tableView)
        guard let indexPath = tableView.indexPathForRow(at: point) else { return false }
        viewModel.updateCell(indexPath: indexPath, subTitle: text)
        return true
    }
}
