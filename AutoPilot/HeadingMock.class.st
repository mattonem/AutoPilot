Class {
	#name : #HeadingMock,
	#superclass : #Object,
	#instVars : [
		'headingValue',
		'values',
		'stearing'
	],
	#category : #'AutoPilot-Tests'
}

{ #category : #accessing }
HeadingMock class >> constant: anInteger [

	^ self new
		  constant: anInteger;
		  yourself
]

{ #category : #'as yet unclassified' }
HeadingMock class >> stearing: aStearingMock [

	^ self new
		  stearing: aStearingMock;
		  constant: (RelativeAngle degrees: 0);
		  yourself
]

{ #category : #'as yet unclassified' }
HeadingMock class >> valuesFrom: aCollection [

	^ self new
		  valuesFrom: aCollection;
		  yourself
]

{ #category : #accessing }
HeadingMock >> constant: anInteger [ 
	headingValue := anInteger 
]

{ #category : #accessing }
HeadingMock >> headingValue [

	stearing ifNotNil: [ 
		headingValue := headingValue + stearing stearingValue
		                + (RelativeAngle degrees: 0.1).
		Transcript
			show: headingValue degreeNumber asString;
			cr.
		^ headingValue ].
	values ifNotNil: [ ^ values removeFirst ].
	^ headingValue
]

{ #category : #'as yet unclassified' }
HeadingMock >> stearing: aStearingMock [ 
	stearing := aStearingMock
]

{ #category : #'as yet unclassified' }
HeadingMock >> valuesFrom: aCollection [ 
	values:= aCollection asOrderedCollection
]
