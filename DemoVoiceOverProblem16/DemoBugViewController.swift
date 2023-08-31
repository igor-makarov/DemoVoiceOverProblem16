//
//  DemoBugViewController.swift
//  DemoVoiceOverProblem16
//
//  Created by Igor Makarov on 31/08/2023.
//

import UIKit

import PureLayout

class DemoBugViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView.newAutoLayout()
    let bar = UIStackView.newAutoLayout()
    let button = UIButton(type: .system).configureForAutoLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewEdges()
        
        view.addSubview(bar)
        bar.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
        bar.autoSetDimension(.height, toSize: 100)
        
        bar.backgroundColor = .systemRed
        bar.axis = .horizontal
        bar.alignment = .center
        bar.addArrangedSubview(button)
        
        button.setTitle("Hit Me", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        
        tableView.contentInset = .init(top: 0, left: 0, bottom: 100, right: 0)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        doTheBug()
    }
    
    func doTheBug() {
        view.isAccessibilityElement = false
        view.accessibilityElements = [
            tableView,
            bar
        ]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = "Row \(indexPath.row)"
        cell.contentConfiguration = contentConfiguration
        return cell
    }
}
