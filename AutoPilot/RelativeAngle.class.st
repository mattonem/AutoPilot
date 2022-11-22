Class {
	#name : #RelativeAngle,
	#superclass : #GAngle,
	#category : #AutoPilot
}

{ #category : #arithmetic }
RelativeAngle >> * anInteger [

	self isReflex
		ifTrue: [ 
		^ (self explementary * anInteger) explementary ]
		ifFalse: [ ^ self _multiplyRadiansByNumber: anInteger ]
]

{ #category : #arithmetic }
RelativeAngle >> _multiplyRadiansByNumber: aNumber [

	^ self class radians: aNumber * self radians
]

{ #category : #arithmetic }
RelativeAngle >> addWithAngle: aGAngle [ 

	^ self class radians: (aGAngle radians + self radians) 
]

{ #category : #arithmetic }
RelativeAngle >> explementary [

	^ self class radians: 0 - self radians
]

{ #category : #arithmetic }
RelativeAngle >> substractWithAngle: aGAngle [

	^ self class radians: (aGAngle radians - self radians) 
]
