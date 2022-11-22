Class {
	#name : #AutoPilotDummy,
	#superclass : #AutoPilot,
	#instVars : [
		'minStearingDThreshold',
		'stearingIncrement',
		'maxStearingIncrement'
	],
	#category : #AutoPilot
}

{ #category : #accessing }
AutoPilotDummy >> maxStearingIncrement: aGAngle [ 
	maxStearingIncrement:=aGAngle
]

{ #category : #accessing }
AutoPilotDummy >> minStearingDThreshold: aGAngle [ 
	minStearingDThreshold:=aGAngle
]

{ #category : #'as yet unclassified' }
AutoPilotDummy >> stearingIncrement: aGAngle [ 
	stearingIncrement:=aGAngle
]

{ #category : #stepping }
AutoPilotDummy >> step [

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
