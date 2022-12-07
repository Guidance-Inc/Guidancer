//
//  LoginViewController.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 04.11.22.
//

import UIKit

protocol LoginRouterDelegate: AnyObject {
    func didSelect(_ controller: LoginViewController)
}

final class LoginViewController: UIViewController, ViewControllerProtocol {
    
    var routerDelegate: LoginRouterDelegate?
    
    private let emailTextField = GTextField(placeholder: "Email address",
                                            font: .medium18)
    private let passwordTextField = GTextField(placeholder: "Password",
                                       font: .medium18)
    
    private let titleLabel = GLabel(text: "Start exploring the world around!", font: .bold27)
    private let choiceLabel = UILabel()
    
    private let signInButton = GRectangleButton(title: "Sign In")
    private let appleButton = GRectangleButton(title: "Continue with Apple",
                                       image: UIImage(systemName: "applelogo"))
    private let googleButton = GRectangleButton(title: "Continue with Google")
    
    lazy var dontHaveAccountButton = UIButton()
    lazy var stack = UIStackView(arrangedSubviews: [emailTextField,
                                                    passwordTextField,
                                                    signInButton,
                                                    choiceLabel,
                                                    appleButton,
                                                    googleButton])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        configLabel()
        configStackView()
        configDontHaveAccountButton()
    }
    
    func configLabel() {
        view.addSubview(titleLabel)
        titleLabel.addAnchors(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                              right: view.rightAnchor,
                              paddingTop: 20, paddingLeft: 20, paddinRight: 20)
        titleLabel.textAlignment = .center
        choiceLabel.text = "or"
        choiceLabel.font = .medium21
        choiceLabel.textAlignment = .center
    }
    
    func configStackView() {
        view.addSubview(stack)
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
    }
    
    func configDontHaveAccountButton() {
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.translatesAutoresizingMaskIntoConstraints = false
        dontHaveAccountButton.addAnchors(left: view.leftAnchor, right: view.rightAnchor,
                                         paddingLeft: 40, paddinRight: 40, height: 30)
        dontHaveAccountButton.topAnchor.constraint(greaterThanOrEqualTo: stack.bottomAnchor).isActive = true
        dontHaveAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                      constant: -20).isActive = true
        let firstAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.gBlack]
        let secondAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                               NSAttributedString.Key.foregroundColor: UIColor.gYellowGreen]
        
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ",
                                                        attributes: firstAttribute)
        attributedTitle.append(NSAttributedString(string: "Sign up here",
                                                  attributes: secondAttribute))
        
        dontHaveAccountButton.setAttributedTitle(attributedTitle, for: .normal)
    }
  
}
