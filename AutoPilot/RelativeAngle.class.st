Class {
	#name : #RelativeAngle,
	#superclass : #GAngle,
	#category : #AutoPilot
}

{ #category : #arithmetic }
RelativeAngle >> * anInteger [

	self isReflex
		ifTrue: [ 
		^ (anInteger multiplyWithAngle: self explementary) explementary ]
		ifFalse: [ ^ anInteger multiplyWithAngle: self ]
]
