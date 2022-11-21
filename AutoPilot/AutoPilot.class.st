Class {
	#name : #AutoPilot,
	#superclass : #Object,
	#instVars : [
		'courseToFollow',
		'headingSensor',
		'stearingActuator',
		'minStearingDThreshold',
		'stearingIncrement',
		'maxStearingIncrement'
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

{ #category : #accessing }
AutoPilot >> maxStearingIncrement: aGAngle [ 
	maxStearingIncrement:=aGAngle
]

{ #category : #accessing }
AutoPilot >> minStearingDThreshold: aGAngle [ 
	minStearingDThreshold:=aGAngle
]

{ #category : #'as yet unclassified' }
AutoPilot >> stearingActuator: aStearingMock [ 
	stearingActuator := aStearingMock
]

{ #category : #'as yet unclassified' }
AutoPilot >> stearingIncrement: aGAngle [ 
	stearingIncrement:=aGAngle
]

{ #category : #stepping }
AutoPilot >> step [

	| deltaCourse |
	deltaCourse := headingSensor headingValue - courseToFollow.

	deltaCourse >= minStearingDThreshold ifTrue: [ 
		deltaCourse < 180 degrees
			ifTrue: [ 
				(maxStearingIncrement - stearingActuator stearingValue) isReflex 
					ifFalse: [ stearingActuator increment: stearingIncrement ] ]
			ifFalse: [ 
				(stearingActuator stearingValue + maxStearingIncrement) isReflex 
					ifFalse: [ stearingActuator decrement: stearingIncrement ] ] ]
]
