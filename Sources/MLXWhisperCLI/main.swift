import Foundation
import MLXWhisper

func main() {
    let args = CommandLine.arguments
    guard args.count > 1 else {
        print("Usage: MLXWhisperCLI <audio_file_path> <model_path>")
        return
    }
    
    let audioFilePath = URL(fileURLWithPath: args[1])
    let modelPath = args.count > 2 ? URL(fileURLWithPath: args[2]) : nil
    
    let modelLoader = ModelLoader(modelPath: modelPath)
    if !modelLoader.loadModel() {
        print("Failed to load model.")
        return
    }
    
    let audioProcessor = AudioProcessor()
    guard let audioBuffer = audioProcessor.prepareAudioFile(for: audioFilePath) else {
        print("Failed to prepare audio file.")
        return
    }
    
    let transcriber = WhisperTranscriber()
    let result = transcriber.transcribeAudioFile(at: audioFilePath)
    print("Transcription: \(result)")
}

main()
