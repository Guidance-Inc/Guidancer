//
//  GRectangleButton.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 01.11.22.
//

import UIKit

class GRectangleButton: UIButton {
    
    init(title: String,
         frame: CGRect = .zero,
         didTap: ((GRectangleButton) -> Void)? = nil
    ) {
        self.title = title
        self.didTap = didTap
        super.init(frame: frame)
        configure()
    }
    
    let title: String
    
    let didTap: ((GRectangleButton) -> Void)?
    
    private func configure() {
        backgroundColor = .black
        setTitle(title, for: .normal)
        layer.cornerRadius = 16
        if didTap != nil {
            addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
    }
    
    @objc private func buttonTapped() {
        guard let didTap = didTap else { return }
        didTap(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
