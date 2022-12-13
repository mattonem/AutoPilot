Class {
	#name : #MockComplexeSystem,
	#superclass : #Object,
	#instVars : [
		'output',
		'k',
		's'
	],
	#category : #'AutoPilot-Tests'
}

{ #category : #accessing }
MockComplexeSystem >> initialize [ 
	k := 0.
	s := 0 degrees.
]

{ #category : #accessing }
MockComplexeSystem >> input: input [

	^ output := output + (k * input) degrees + s value
]

{ #category : #accessing }
MockComplexeSystem >> k: aVal [

	k := aVal
]

{ #category : #accessing }
MockComplexeSystem >> output [
	^ output
]

{ #category : #accessing }
MockComplexeSystem >> output: aVal [
	output := aVal
]

{ #category : #'as yet unclassified' }
MockComplexeSystem >> s: aNumber [ 
	s := aNumber
]
