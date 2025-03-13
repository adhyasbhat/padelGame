import Foundation
import Intents

// This class defines the custom intent for updating the score
public class UpdateScoreIntent: INIntent {
    // Properties for the intent parameters
    @NSManaged public var player: String?
    @NSManaged public var playerAScore: NSNumber?
    @NSManaged public var playerBScore: NSNumber?
}

// This protocol defines the handling of the UpdateScoreIntent
@objc public protocol UpdateScoreIntentHandling: NSObjectProtocol {
    @objc(handleUpdateScoreIntent:completion:)
    func handle(intent: UpdateScoreIntent, completion: @escaping (UpdateScoreIntentResponse) -> Void)
}

// This class defines the response for the custom intent
public class UpdateScoreIntentResponse: INIntentResponse {
    // Enum for response codes
    public enum Code: Int {
        case unspecified = 0
        case ready
        case continueInApp
        case success
        case failure
    }
    
    // Properties for the response parameters
    @NSManaged public var updatedScore: String?
    
    // Initializer
    public init(code: Code) {
        // Provide the appropriate initializer
        self.code = code
        super.init()
    }
    
    // Required initializer
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // Property to hold the response code
    public var code: Code = .unspecified
}
