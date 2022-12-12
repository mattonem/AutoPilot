"
An ErrorCalculatorTest is a test class for testing the behavior of ErrorCalculator
"
Class {
	#name : #ErrorCalculatorTest,
	#superclass : #TestCase,
	#category : #'AutoPilot-Tests'
}

{ #category : #tests }
ErrorCalculatorTest >> testNegativeErrorCalculation [
	| err |
	err := ErrorCalculator new.
	err headingValue: 100 degrees. 
	err course: 90 degrees. 
	self assert: err headingValue closeTo: -10
]

{ #category : #tests }
ErrorCalculatorTest >> testNegativeErrorReflexCalculation [
	| err |
	err := ErrorCalculator new.
	err headingValue: -90 degrees. 
	err course: -100 degrees. 
	self assert: err headingValue closeTo: -10
]

{ #category : #tests }
ErrorCalculatorTest >> testPositiveErrorCalculation [
	| err |
	err := ErrorCalculator new.
	err headingValue: 90 degrees. 
	err course: 100 degrees. 
	self assert: err headingValue closeTo: 10
]

{ #category : #tests }
ErrorCalculatorTest >> testPositiveErrorReflexCalculation [
	| err |
	err := ErrorCalculator new.
	err headingValue: -90 degrees. 
	err course: -80 degrees. 
	self assert: err headingValue closeTo: 10
]
