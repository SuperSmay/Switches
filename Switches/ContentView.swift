//
//  ContentView.swift
//  Switches
//
//  Created by Sam Askling on 7/2/22.
//

import SwiftUI

let baseHue = Double.random(in: 0...1)

func getNewOffsetValue() -> Double {
    var value = Double.random(in: -0.5...0.5)
    if abs(value) < 0.05 { value *= 2 }
    return value
}


private struct HueToggle: Identifiable {
    let hue: Double
    let value: Double = getNewOffsetValue()
    var isOn: Bool = false
    var color: Color {
        get {Color(hue: hue, saturation: 0.5, brightness: 0.5)}
        set {print("Hi there")}
        
    }
    var id: Color { color }
}
private struct SaturationToggle: Identifiable {
    let saturation: Double
    let value: Double = getNewOffsetValue()
    var isOn: Bool = false
    var color: Color {
        get {Color(hue: 0, saturation: saturation, brightness: 0.5)}
        set {}
        
    }
    var id: Color { color }
}
private struct BrightnessToggle: Identifiable {
    let brightness: Double
    let value: Double = getNewOffsetValue()
    var isOn: Bool = false
    var color: Color {
        get {Color(hue: 0, saturation: 0, brightness: brightness)}
        set {}
        
    }
    var id: Color { color }
}

struct ContentView: View {
    
    @State var hue: Double = baseHue
    @State var saturation: Double = 0.5
    @State var brightness: Double = 0.5
    
    func getHueStack() -> some View {
        return VStack {
            Spacer()
            Spacer()
            
            ForEach($hueToggles) { (hueToggle: Binding<HueToggle>) in
                Toggle("", isOn: hueToggle.isOn)
                    .labelsHidden()
                    .tint(hueToggle.color.wrappedValue)
                    .onChange(of: hueToggle.isOn.wrappedValue) { value in
                        withAnimation(.interactiveSpring()) {
                            changeColor()
                        }
                    }
                    .frame(width: 100, height: 60)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation {
                            hueToggle.isOn.wrappedValue.toggle()
                            let impactMed = UIImpactFeedbackGenerator(style: .light)
                            impactMed.impactOccurred()
                                        }
                    }
//                Spacer()
            }
            Spacer()
        }
    }
    
    func getSaturationStack() -> some View {
        return VStack {
            Spacer()
            Spacer()
            
            ForEach($saturationToggles) { (saturationToggle: Binding<SaturationToggle>) in
                Toggle("", isOn: saturationToggle.isOn)
                    .labelsHidden()
                    .tint(saturationToggle.color.wrappedValue)
                    .onChange(of: saturationToggle.isOn.wrappedValue) { value in
                        withAnimation(.interactiveSpring()) {
                            changeColor()
                        }
                    }
                    .frame(width: 100, height: 60)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation {
                            saturationToggle.isOn.wrappedValue.toggle()
                            let impactMed = UIImpactFeedbackGenerator(style: .light)
                            impactMed.impactOccurred()
                                        }
                    }
                
//                Spacer()
            }
            Spacer()
        }
    }
    
    func getBrightnessStack() -> some View {
        return VStack {
            Spacer()
            Spacer()
            
            ForEach($brightnessToggles) { (brightnessToggle: Binding<BrightnessToggle>) in
                Toggle("", isOn: brightnessToggle.isOn)
                    .labelsHidden()
                    .tint(brightnessToggle.color.wrappedValue)
                    .onChange(of: brightnessToggle.isOn.wrappedValue) { value in
                        withAnimation(.interactiveSpring()) {
                            changeColor()
                        }
                    }
                    .frame(width: 100, height: 60)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation {
                            brightnessToggle.isOn.wrappedValue.toggle()
                            let impactMed = UIImpactFeedbackGenerator(style: .light)
                            impactMed.impactOccurred()
                                        }
                    }
//                Spacer()
                    
            }
            Spacer()
        }
    }
    
    func changeColor() {
        hue = {
            var value = baseHue
            for hueToggle in hueToggles {
                if hueToggle.isOn {
                    
                    if value + hueToggle.value > 1 {
                        value -= 0.5
                    }
                    
                    else if value + hueToggle.value < 0 {
                        value += 0.5
                    }
                        
                    value += hueToggle.value
                    
                }
            }
            return value
        }()
        saturation = {
            var value = 0.5
            for saturationToggle in saturationToggles {
                if saturationToggle.isOn {
                    
                    if value + saturationToggle.value > 1 {
                        value -= 0.5
                    }
                    
                    else if value + saturationToggle.value < 0 {
                        value += 0.5
                    }
                    
                    value += saturationToggle.value
                    
                }
            }
            return value
        }()
        brightness = {
            var value = 0.5
            for brightnessToggle in brightnessToggles {
                if brightnessToggle.isOn {
                    
                    if value + brightnessToggle.value > 1 {
                        value -= 0.5
                    }
                    
                    else if value + brightnessToggle.value < 0 {
                        value += 0.5
                    }
                    
                    value += brightnessToggle.value
                    
                }
            }
            return value
        }()
        print("H: \(hue), S: \(saturation), B: \(brightness)")
    }
    

    
    @State private var hueToggles: [HueToggle] = [
        HueToggle(hue: 0),
        HueToggle(hue: 0.1),
        HueToggle(hue: 0.2),
        HueToggle(hue: 0.3),
        HueToggle(hue: 0.4),
        HueToggle(hue: 0.5),
        HueToggle(hue: 0.6),
        HueToggle(hue: 0.7),
        HueToggle(hue: 0.8),
        HueToggle(hue: 0.9),
    ]
    
    @State private var saturationToggles: [SaturationToggle] = [
        SaturationToggle(saturation: 0),
        SaturationToggle(saturation: 0.1),
        SaturationToggle(saturation: 0.2),
        SaturationToggle(saturation: 0.3),
        SaturationToggle(saturation: 0.4),
        SaturationToggle(saturation: 0.5),
        SaturationToggle(saturation: 0.6),
        SaturationToggle(saturation: 0.7),
        SaturationToggle(saturation: 0.8),
        SaturationToggle(saturation: 0.9),
    ]

    
    @State private var brightnessToggles: [BrightnessToggle] = [
        BrightnessToggle(brightness: 0),
        BrightnessToggle(brightness: 0.1),
        BrightnessToggle(brightness: 0.2),
        BrightnessToggle(brightness: 0.3),
        BrightnessToggle(brightness: 0.4),
        BrightnessToggle(brightness: 0.5),
        BrightnessToggle(brightness: 0.6),
        BrightnessToggle(brightness: 0.7),
        BrightnessToggle(brightness: 0.8),
        BrightnessToggle(brightness: 0.9),
    ]

    var body: some View {
        ZStack {
            Color(hue: hue, saturation: saturation, brightness: brightness).ignoresSafeArea()
            
            HStack {
                
//                Spacer()
            
                getHueStack()
                
//                Spacer()
                
                getSaturationStack()
                
//                Spacer()
                
                getBrightnessStack()
                
//                Spacer()
                    
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
