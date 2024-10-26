import Foundation
import AVFoundation

public class AudioProcessor {
    private var audioEngine: AVAudioEngine

    public init() {
        self.audioEngine = AVAudioEngine()
    }

    public func prepareAudioFile(for url: URL) -> AVAudioPCMBuffer? {
        do {
            let file = try AVAudioFile(forReading: url)
            let format = file.processingFormat
            guard let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: AVAudioFrameCount(file.length)) else {
                return nil
            }
            try file.read(into: buffer)
            return buffer
        } catch {
            print("Error preparing audio file: \(error)")
            return nil
        }
    }
}
