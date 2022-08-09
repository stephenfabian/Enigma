# Self Evaluation

## *Functionality*

    Grade: Meets Expectations

    Explanation: Enigma Class with encrypt and decrypt methods successfully implemented. Encrypt/decrypt command line interfaces successfully implemented

## *Object Oriented Programming*
    Grade: Above Expectations

    Explanation: One module implemented in a logical manner. 
  * Shiftable module - Function is to calculate the shifts based off of the key and date.  Methods .shifts_hash and .shifts_hash_backwards are used by both the Enigma and Rotate classes. Shiftable can be separate because the other classes don't need to know about shift calculations.  The module improves the encapsulation of code in this project.
  * Enigma class - Returns hash output of encryption/decryption, and the key and date used for encryption/decryption.
  * Rotate class - Rotates the each letter of a given message.

## *Ruby Conventions and Mechanics*	
    Grade: Meets Expecations

    Explanation: Code is mostly properly indented, spaced, and lines are not excessively long. Class, method, variable, and file names follow convention.  Classes all under 100 lines. Several hashes implemented.

## *Test Driven Development*	
    Grade: Meets Expectations

    Explanation: SimpleCov at 100%.  Every method is tested at both the unit and integration level, and completely verify expected behavior.  Obvious edge cases are addressed(such as message having capital letters or special characters.) Git history shows tests are written before implementation code. 


## *Version Control*	

    Grade: Above Expectations

    Explanation: Around 60 commits and 19 pull requests. All pull requests include related and logical chunks of functionality, and are named and documented to clearly communicate the purpose of the pull request.  Notations such as "feat: fix: refactor" are used. No commits include multiple pieces of functionality.
