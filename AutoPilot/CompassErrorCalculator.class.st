Class {
	#name : #CompassErrorCalculator,
	#superclass : #Object,
	#instVars : [
		'heading',
		'course'
	],
	#category : #'AutoPilot-Core'
}

{ #category : #'as yet unclassified' }
CompassErrorCalculator >> course: anAngl [
	course := anAngl
]

{ #category : #'as yet unclassified' }
CompassErrorCalculator >> headingValue [

	^ (course - heading + 180 degrees) degreeNumber - 180
]

{ #category : #'as yet unclassified' }
CompassErrorCalculator >> headingValue: anAng [
	heading := anAng.
	^ self headingValue 
]

{ #category : #'as yet unclassified' }
CompassErrorCalculator >> initialize [ 
	course := 0 degrees
]
