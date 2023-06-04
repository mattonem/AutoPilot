Class {
	#name : #AngularMockComplexeSystem,
	#superclass : #Object,
	#instVars : [
		'output',
		'k',
		's'
	],
	#category : #'AutoPilot-Tests'
}

{ #category : #accessing }
AngularMockComplexeSystem >> initialize [ 
	k := 0.
	s := 0 degrees.
]

{ #category : #accessing }
AngularMockComplexeSystem >> input: input [

	^ output := output + (k * input) degrees + s value
]

{ #category : #accessing }
AngularMockComplexeSystem >> k: aVal [

	k := aVal
]

{ #category : #accessing }
AngularMockComplexeSystem >> output [
	^ output
]

{ #category : #accessing }
AngularMockComplexeSystem >> output: aVal [
	output := aVal
]

{ #category : #'as yet unclassified' }
AngularMockComplexeSystem >> s: aNumber [ 
	s := aNumber
]
