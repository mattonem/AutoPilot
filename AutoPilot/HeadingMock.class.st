Class {
	#name : #HeadingMock,
	#superclass : #Object,
	#instVars : [
		'headingValue'
	],
	#category : #'AutoPilot-Tests'
}

{ #category : #accessing }
HeadingMock class >> constant: anInteger [

	^ self new
		  constant: anInteger;
		  yourself
]

{ #category : #accessing }
HeadingMock >> constant: anInteger [ 
	headingValue := anInteger 
]

{ #category : #accessing }
HeadingMock >> headingValue [
	^ headingValue
]
