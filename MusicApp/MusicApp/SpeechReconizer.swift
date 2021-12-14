//
//  SpeechReconizer.swift
//  MusicApp
//
//  Created by iosdev on 14.12.2021.
//
import AVFoundation
import Foundation
import Speech
import SwiftUI

struct SpeechRecognizer {
    private class SpeechAssist {
        
        var audioEngine: AVAudioEngine?
        var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
        var recognitionTask: SFSpeechRecognitionTask?
        let speechRecognizer = SFSpeechRecognizer()
        
        deinit {
            reset()
        }
        
        func reset() {
            audioEngine?.inputNode.removeTap(onBus: 0)
            recognitionTask?.cancel()
            audioEngine?.stop()
            audioEngine = nil
            recognitionRequest = nil
            recognitionTask = nil
        }
    }
    
    private let assistant = SpeechAssist()
    
    func record(to speech: Binding<String>) {
        relay(speech, message: "Requesting access")
        canAccess { authorized in
            guard authorized else {
                relay(speech, message: "Access denied")
                return
            }
            
           
            assistant.audioEngine = AVAudioEngine()
            guard let audioEngine = assistant.audioEngine else {
                fatalError("Unable to create audio engine")
            }
            
            assistant.recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
            guard let recognitionRequest = assistant.recognitionRequest else {
                fatalError("Unable to create request")
            }
            
            recognitionRequest.shouldReportPartialResults = true
            
            do {
                let audioSession = AVAudioSession.sharedInstance()
                                try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
                                try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
                                let inputNode = audioEngine.inputNode
                                
                                let recordingFormat = inputNode.outputFormat(forBus: 0)
                                inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
                                    recognitionRequest.append(buffer)
                                }
                                audioEngine.prepare()
                                try audioEngine.start()
                                assistant.recognitionTask = assistant.speechRecognizer?.recognitionTask(with: recognitionRequest) { (result, error) in
                                    var isFinal = false
                                    if let result = result {
                                        relay(speech, message: result.bestTranscription.formattedString)
                                        isFinal = result.isFinal
                                    }
                                    
                    if error != nil {
                        audioEngine.stop()
                        inputNode.removeTap(onBus: 0)
                        self.assistant.recognitionRequest = nil
                    }
                }
            } catch {
                print("Error transcibing audio: " + error.localizedDescription)
                assistant.reset()
            }
        }
    }

    func stopRecording() {
        assistant.reset()
    }
    
    private func canAccess(withHandler handler: @escaping (Bool) -> Void) {
        SFSpeechRecognizer.requestAuthorization { status in
            if status == .authorized {
                AVAudioSession.sharedInstance().requestRecordPermission { authorized in
                    handler(authorized)
                }
            } else {
                handler(false)
            }
        }
    }
    
    private func relay(_ binding: Binding<String>, message: String) {
        DispatchQueue.main.async {
            binding.wrappedValue = message
        }
    }
}
