import Foundation

extension TimeInterval {
    var formattedTime: String {
        let hours = Int(self) / 3600
        let minutes = (Int(self) % 3600) / 60
        let seconds = Int(self) % 60
        let milliseconds = Int((self - floor(self)) * 100)  // Get 2 decimal places
        
        if hours > 0 {
            return String(format: "%d:%02d:%02d.%02d hours", hours, minutes, seconds, milliseconds)
        } else if minutes > 0 {
            return String(format: "%02d:%02d.%02d minutes", minutes, seconds, milliseconds)
        } else {
            return String(format: "%02d.%02d seconds", seconds, milliseconds)
        }
    }
}
