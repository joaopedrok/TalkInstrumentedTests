//
//  WelcomeViewController.swift
//  TalkInstrumentedTests
//
//  Created by Joao Souza on 26/04/2018.
//  Copyright © 2018 Concrete. All rights reserved.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController, CodableView {

    let labelWelcome: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        lb.numberOfLines = 0
        lb.textAlignment = .center

        return lb
    }()

    let username: String

    init(username: String) {
        self.username = username
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fill(username: username)
    }

    private func fill(username: String) {
        labelWelcome.text = "Bem Vindo, " + username
    }

    func configViews() {
        title = "Bem Vindo"

        view.backgroundColor = .white
    }

    func buildViews() {
        view.addSubview(labelWelcome)
    }

    func configConstraints() {
        labelWelcome.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            constraint.left.equalToSuperview().offset(20)
            constraint.right.equalToSuperview().inset(20)
        }
    }
}
