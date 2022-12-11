//
//  ViewController.swift
//  CoreAnimation
//
//  Created by Oxyenniu on 11.12.2022.
//

import UIKit
import SpringAnimation
class ViewController: UIViewController {

    @IBOutlet weak var animationView: SpringView!
    @IBOutlet var infoLabels: [UILabel]!
    @IBOutlet weak var buttonTapped: UIButton!
    
    var nameOfAnimation: AnimationPreset!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOfAnimation = AnimationPreset.fadeIn
        randomCharacters(preset: nameOfAnimation)
    }

    @IBAction func buttonTapped(_ sender: SpringButton) {
        randomCharacters(preset: nameOfAnimation)
        animationView.animate()
        nameOfAnimation = AnimationPreset.allCases.randomElement()
        buttonTapped.setTitle("Run \(nameOfAnimation ?? .fadeIn)", for: .normal)
    }
    
}

extension ViewController {
    private func randomCharacters(preset: AnimationPreset) {
        infoLabels[0].text = "Preset is \(preset)"
        
        animationView.animation = "\(preset)"
        
        let someCurve = AnimationCurve.allCases.randomElement ()
        animationView.curve = someCurve?.rawValue ?? ""
        infoLabels [1].text = "curve: \(someCurve? .rawValue ?? "")"
        
        let force = round( (Double.random(in: 1...5) * 100)) / 100
        animationView.force = force
        infoLabels[2].text = "force: \(force)"
    
        let duration = round ((Double.random(in: 0.5...5) * 100)) / 100
        animationView.duration = duration
        infoLabels[3].text = "duration: \(duration)"
        
        let delay = round( (Double.random(in: 0...5) * 100)) / 100
        animationView.force = delay
        infoLabels[4].text = "delay: \(delay)"
        
        
        
    }
}
