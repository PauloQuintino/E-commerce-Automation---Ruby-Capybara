@login
Feature: Do online purchase

@purchase_01
Scenario: Do online purchase with success
    Given I choose '<product>', '<quantity>', '<color>' and '<size>' of the product
    And confirm  the adress and delivery options
    When choose the '<payment>' method and confirm 
    Then the purchase should be successfully realized
    Examples:
    |product                    |quantity|color |size|payment       |
    |Faded Short Sleeve T-shirts|1       |Blue  |M   |Bank Transfer |
    |Printed Dress              |3       |Orange|L   |Check         |


@history
Scenario: Check purchase in the order history
Given I access the order history
Then the order number '<order>' should be visible in the history
Examples:
|order    |
|ANCNLKIHW|
# |UYFJXNPCQ| 
# |MWUTQPGRX|
# |ZRBUWPREG|