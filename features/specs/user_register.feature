Feature: User registration

@registration
Scenario: Register user successfully
    Given I access the website
    When sign in passing all data:
    | email         |capy@test.com.br.qa |
    | title         | Mr                 |
    | firstName     | Tester             |
    | lastName      | Automation         |
    | password      | 123456             |
    | birthDay      | 10                 |
    | birthMonth    | 1                  |
    | birthYear     | 1993               |
    | address       | Automation Street  |
    | city          | Dallas             |
    | state         | Texas              |
    | zipcode       | 75201              |
    | country       | United States      |
    | mobile        | 999999999          |
    | assignAddress | Actual Address     |
    Then the registration should be successfully realized