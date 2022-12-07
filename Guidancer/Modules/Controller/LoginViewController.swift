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

class LoginViewController: UIViewController, ViewControllerProtocol {
    
    let titleButton = String("Sign In")
    
    var routerDelegate: LoginRouterDelegate?
    
    let emailTextField = GTextField(placeholder: "Email address", font: .medium18)
    let passwordTextField = GTextField(placeholder: "Password", font: .medium18)
    
    let titleLabel = GLabel(text: "Start exploring the world around!", font: .bold27)
    let choiceLabel = UILabel()
    
    lazy var signInButton = GRectangleButton(title: titleButton)
    let appleButton = GRectangleButton(title: "Continue with Apple", image: UIImage(systemName: "applelogo"))
    let googleButton = GRectangleButton(title: "Continue with Google", image: UIImage(named: "googlelogo"))
    
    lazy var dontHaveAccountButton: UIButton = {
        let button = configButton(firstPart: "Don't have an account?", secondPart: " Sign up here")
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
                
        view.addSubview(titleLabel)
        titleLabel.addAnchors(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddinRight: 20)
        titleLabel.textAlignment = .center
        
        choiceLabel.text = "or"
        choiceLabel.font = .medium21
        choiceLabel.textAlignment = .center
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, signInButton, choiceLabel, appleButton, googleButton])
        
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        
        view.addSubview(stack)
        view.addSubview(dontHaveAccountButton)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        
        dontHaveAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        dontHaveAccountButton.addAnchors(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 40, paddinRight: 40, height: 30)
        dontHaveAccountButton.topAnchor.constraint(greaterThanOrEqualTo: stack.bottomAnchor).isActive = true
        dontHaveAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
    }
    func configButton(firstPart: String, secondPart: String) -> UIButton {
        let button = UIButton(type: .system)
        
        let firstAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.gBlack]
        let secondAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                               NSAttributedString.Key.foregroundColor: UIColor.gYellowGreen]
        
        let attributedTitle = NSMutableAttributedString(string: firstPart, attributes: firstAttribute)
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: secondAttribute))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }
}
