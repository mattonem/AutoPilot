Class {
	#name : #StearingMock,
	#superclass : #Object,
	#instVars : [
		'stearingValue'
	],
	#category : #'AutoPilot-Tests'
}

{ #category : #accessing }
StearingMock class >> startAt: anInteger [

	^ self new
		  startAt: anInteger;
		  yourself
]

{ #category : #'as yet unclassified' }
StearingMock >> decrement: aGAngle [ 
	stearingValue := stearingValue - aGAngle
]

{ #category : #'as yet unclassified' }
StearingMock >> increment: aGAngle [ 
	stearingValue := stearingValue + aGAngle 
]

{ #category : #accessing }
StearingMock >> startAt: anInteger [ 
	stearingValue := anInteger 
]

{ #category : #'as yet unclassified' }
StearingMock >> stearingValue [
	^ stearingValue
]
