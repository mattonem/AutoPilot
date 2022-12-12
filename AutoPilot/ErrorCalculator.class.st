Class {
	#name : #ErrorCalculator,
	#superclass : #Object,
	#instVars : [
		'heading',
		'course'
	],
	#category : #AutoPilot
}

{ #category : #'as yet unclassified' }
ErrorCalculator >> course: anAngl [
	course := anAngl
]

{ #category : #'as yet unclassified' }
ErrorCalculator >> headingValue [

	^ (course - heading + 180 degrees) degreeNumber - 180
]

{ #category : #'as yet unclassified' }
ErrorCalculator >> headingValue: anAng [
	heading := anAng.
	^ self headingValue 
]

{ #category : #'as yet unclassified' }
ErrorCalculator >> initialize [ 
	course := 0 degrees
]
