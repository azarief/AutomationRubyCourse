Feature: Registration Success

    Scenario: User try to registration
        Given user access to main page
        When user open registration
        When user fill registration with "valid"
        Then user success registration

    Scenario: Invalid email Registration
        Given user access to main page
        When user open registration
        When user fill registration with "invalid email"
        Then user failed registration

    Scenario: User open class detail
        Given user access to main page
        
