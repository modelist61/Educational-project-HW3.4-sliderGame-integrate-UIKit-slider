//
//  ColorSliderUIKit.swift
//  HW3.4 sliderGame int UIKit
//
//  Created by Dmitry Tokarev on 21.12.2020.
//

import SwiftUI

struct ColorSliderUIKit: UIViewRepresentable {
    @Binding var sliderValue: Double
    let alphaValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .red
        slider.tintColor = .red
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(sliderValue)
        uiView.alpha = CGFloat(alphaValue)
    }
    func makeCoordinator() -> ColorSliderUIKit.Coordinator {
        Coordinator(value: $sliderValue)
    }
}

extension ColorSliderUIKit {
    class Coordinator: NSObject {
        @Binding var sliderValue: Double
        
        init( value: Binding<Double> ) {
            self._sliderValue = value
        }
        
        @objc func valueChanged( _ sender: UISlider) {
            sliderValue = Double(sender.value)
        }
    }
}

struct ColorSliderUIKit_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderUIKit(sliderValue: .constant(55.5), alphaValue: 0.5)
    }
}
