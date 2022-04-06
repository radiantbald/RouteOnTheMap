//
//  ViewController.swift
//  RouteOnTheMap
//
//  Created by Олег Попов on 06.04.2022.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    let addAdressButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let routeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "route"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "reset"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraints()
        
        addAdressButton.addTarget(self, action: #selector(addAdressButtonTapped), for: .touchUpInside)
        routeButton.addTarget(self, action: #selector(routeButtonTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    @objc func addAdressButtonTapped() {
        alertAddAdress(title: "Добавить адрес", placeholder: "Введите адрес") { (text) in
            print(text)
        }
    }
    @objc func routeButtonTapped() {
        print("TapRoute")
    }
    @objc func resetButtonTapped() {
        print("TapReset")
    }
}

extension ViewController {
    
    func setConstraints() {
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        mapView.addSubview(addAdressButton)
            NSLayoutConstraint.activate([
                addAdressButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -50),
                addAdressButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -75),
                addAdressButton.heightAnchor.constraint(equalToConstant: 50),
                addAdressButton.widthAnchor.constraint(equalToConstant: 50)
            ])
        
        mapView.addSubview(routeButton)
            NSLayoutConstraint.activate([
                routeButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -50),
                routeButton.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 75),
                routeButton.heightAnchor.constraint(equalToConstant: 50),
                routeButton.widthAnchor.constraint(equalToConstant: 50)
            ])
        
        mapView.addSubview(resetButton)
            NSLayoutConstraint.activate([
                resetButton.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 50),
                resetButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
                resetButton.heightAnchor.constraint(equalToConstant: 50),
                resetButton.widthAnchor.constraint(equalToConstant: 50)
            ])
        
    }
}
