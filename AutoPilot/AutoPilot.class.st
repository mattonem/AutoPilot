Class {
	#name : #AutoPilot,
	#superclass : #Object,
	#instVars : [
		'courseToFollow',
		'headingSensor',
		'stearingActuator'
	],
	#category : #AutoPilot
}

{ #category : #'as yet unclassified' }
AutoPilot >> courseToFollow: aGAngle [ 
	courseToFollow := aGAngle
]

{ #category : #'as yet unclassified' }
AutoPilot >> headingSensor: aHeadingMock [ 
	headingSensor := aHeadingMock
]

{ #category : #'as yet unclassified' }
AutoPilot >> stearingActuator: aStearingMock [ 
	stearingActuator := aStearingMock
]

{ #category : #stepping }
AutoPilot >> step [

	self subclassResponsibility
]
