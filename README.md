# Simple messaging

**Approach** 
The app was built to adhere to SOLID principles, tests were written using TDD. 

**Building the UI**
I wanted to demonstrate that I can build interfaces in different ways if required. For example:
1. Messages Feed is in UIKit with a storyboard 
2. Message Feed Table Cell is in UIKit built programmatically 
3. Message detail is built in SwiftUI but hosted in a ViewController
In a real-world project, I’d be consistent with my approach.

**Project Architecture**
* I started by importing some swift packages from my own personal projects to speed up construction. 
* The architecture in mind for the long-term future of the app is a vertical layered structure of platform agnostic components with Core Layers at the bottom of the project and then the presentation layer at the top. 
* The beginnings of the architecture defined above can be seen in the current project state. The next step would be to move the features into their own packages. For each feature, there would be one platform-agnostic package for the business logic and another purely for the UI. The extent of the robustness of this architecture would be determined by the company's needs and values at the time.

**Concepts Used in Testing**
To demonstrate that I can write tests I wrote some using TDD while building the app. The number of tests and extent of coverage in a real-world project would depend on the company's needs and values. Integration tests were not written. However, the beginnings of one for the chat feed view model were written with the addition of a `SpyChatFeed`. Below are some concepts brought in for testing.
1. `makeSUT`
In many schools of thought the SUT is created in the setUp method of XCTestCase. The downside is that if the SUT is not torn down properly it can remain with its side effects and re-used in other tests, leading to false positives in other tests. `makeSUT` Isolates the System Under Test within a function that way its torn down naturally and destroyed by the end of the functions execution, this way it does not interfere with other tests. This adheres to the F is the F.I.R.S.T principle of automated testing (Independent/Isolated).
2. Specs for Test Cases: Added “specs” for tests defined in protocols. They define the required test cases for a component or feature. For example, if we have a `LocalJSONChatService` as a temporary solution with a `RemoteChatService` in mind both would use the same spec to adhere to the base use cases defined in the spec to be valid and safely interchangeable. The spec ensures consistency, acts as documentation, and aligns with TDD practices.
3. Test doubles
    a. Test doubles: are used to better control, isolate and speed up tests in contrast to "real" objects
    

