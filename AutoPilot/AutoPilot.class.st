Class {
	#name : #AutoPilot,
	#superclass : #Object,
	#instVars : [
		'headingSensor',
		'stearingActuator'
	],
	#category : #AutoPilot
}

{ #category : #'as yet unclassified' }
AutoPilot >> headingSensor: aHeadingMock [ 
	headingSensor := aHeadingMock
]

{ #category : #'as yet unclassified' }
AutoPilot >> stearingActuator: aStearingMock [ 
	stearingActuator := aStearingMock
]

{ #category : #'as yet unclassified' }
AutoPilot >> step: aValue [
	self subclassResponsibility
]
