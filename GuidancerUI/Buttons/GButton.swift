//
//  GButton.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 02.11.22.
//

import UIKit

class GButton: UIButton {
    
    init(didTap: ((UIButton) -> Void)? = nil, frame: CGRect = .zero) {
        self.didTap = didTap
        super.init(frame: frame)
        configureUI()
        if didTap != nil {
            addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
    }
    
    let didTap: ((UIButton) -> Void)?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
    }
    
    @objc private func buttonTapped() {
        guard let didTap = didTap else { return }
        didTap(self)
    }
    
}
