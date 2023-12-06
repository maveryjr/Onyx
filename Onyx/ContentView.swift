//
//  ContentView.swift
//  Onyx
//
//  Created by Michael L. Avery Jr. on 12/6/23.
//

import SwiftUI
import SiriWaveView

struct ContentView: View {
    
    @State var vm = ViewModel()
    @State var isSymbolAnimating = false
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Onyx AI Voice Assistant")
                .font(.title2)
            
            Spacer()
            SiriWaveView()
                .power(power: vm.audioPower)
                .opacity(vm.siriWaveFormOpacity)
                .frame(height: 256)
                .overlay { overlayView }
            Spacer()
            
            switch vm.state {
            case .recordingSpeech:
                cancelRecordingButton
                
            case .processsingSpeech, .playingSpeech:
                cancelButton
                
            default: EmptyView()
            }
            
            Picker("Select Voice", selection:
                    $vm.selectedVoice) {
                ForEach(VoiceType.allCases, id:
                            \.self) {
                    Text($0.rawValue).id($0)
                }
            }
                    .pickerStyle(.segmented)
                    .disabled(!vm.isIdle)
            
            if case let .error(error) = vm.state {
                Text(error.localizedDescription)
                    .foregroundStyle(.red)
                    .font(.caption)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            }
        }
        .padding() // This ensures that the VStack has padding around it.
    }
    
    @ViewBuilder
    var overlayView: some View {
        switch vm.state {
        case .idle, .error:
            startCaptureButton
        case .processsingSpeech:
            Image(systemName: "brain")
                .symbolEffect(.bounce.up.byLayer,
                              options: .repeating, value: isSymbolAnimating)
                .font(.system(size: 128))
                .onAppear { isSymbolAnimating = true }
                .onDisappear { isSymbolAnimating = false }
        default:
            EmptyView()
        }
    }
    
    
    
    var startCaptureButton: some View {
        Button {
            vm.startCaptureAudio()
        } label: {
            Image(systemName: "mic.circle")
                .symbolRenderingMode(.multicolor)
                .font(.system(size: 128))
        }.buttonStyle(.borderless)
    }
    
    var cancelRecordingButton: some View {
        Button(role: .destructive) {
            vm.cancelRecording()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .symbolRenderingMode(.multicolor)
                .font(.system(size: 44))
        }.buttonStyle(.borderless)
    }
    
    var cancelButton: some View {
        Button {
            vm.cancelProcessingTask()
        } label: {
            Image(systemName: "stop.circle.fill")
                .symbolRenderingMode(.monochrome)
                .foregroundStyle(.red)
                .font(.system(size: 44))
        }.buttonStyle(.borderless)
    }
    
}
        
        #Preview("Idle") {
            ContentView()
        }
        
        #Preview("Recording Speech") {
            let vm = ViewModel()
            vm.state = .recordingSpeech
            vm.audioPower = 0.2
            return ContentView(vm: vm)
        }
        
        #Preview("Processing Speech") {
            let vm = ViewModel()
            vm.state = .processsingSpeech
            return ContentView(vm: vm)
        }
        
        #Preview("Playing Speech") {
            let vm = ViewModel()
            vm.state = .playingSpeech
            vm.audioPower = 0.3
            return ContentView(vm: vm)
        }
        
        #Preview("Error") {
            let vm = ViewModel()
            vm.state = .error("An Error has occured")
            return ContentView(vm: vm)
        }
