Feature: Flipkart Feature
    Search text and verify result
    
    Scenario: Is text searched
        Given Text to seach is "<text_to_search>"
        When Text is searched, where type is "<type>"
        Then I should get first produce name as "<first_product>"

        Examples:
            | text_to_search | first_product                                | type |
            | mobile         | realme C11 2021 (Cool Blue, 32 GB)           | 1    |
            | tshirt         | Graphic Print Men Round Neck White T-Shirt   | 2    |
            | laptop         | Dell                                         | 1    |
            | watches        | watches                                      | 2    |      