Class {
	#name : #HeadingMock,
	#superclass : #Object,
	#instVars : [
		'headingValue',
		'values'
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
	values ifNotNil: [ 
		^ values removeFirst
		 ].
	^ headingValue
]

{ #category : #'as yet unclassified' }
HeadingMock >> valuesFrom: aCollection [ 
	values:= aCollection asOrderedCollection
]
