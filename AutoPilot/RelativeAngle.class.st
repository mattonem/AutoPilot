Class {
	#name : #RelativeAngle,
	#superclass : #GAngle,
	#category : #'AutoPilot-Tests'
}

{ #category : #arithmetic }
RelativeAngle >> * anInteger [

	^ self isReflex
		ifTrue: [ (self explementary * anInteger) explementary ]
		ifFalse: [ self _multiplyRadiansByNumber: anInteger ]
]

{ #category : #arithmetic }
RelativeAngle >> _multiplyRadiansByNumber: aNumber [

	^ self class radians: aNumber * self radians
]

{ #category : #arithmetic }
RelativeAngle >> addWithAngle: aGAngle [ 

	^ self class radians: (aGAngle radians + self radians) 
]

{ #category : #comparing }
RelativeAngle >> closeTo: anInteger precision: aNumber [

	^ self isReflex
		  ifTrue: [ self explementary closeTo: anInteger precision: aNumber ]
		  ifFalse: [ (self - anInteger) <= aNumber ]
]

{ #category : #arithmetic }
RelativeAngle >> explementary [

	^ self class radians: 0 - self radians
]

{ #category : #arithmetic }
RelativeAngle >> substractWithAngle: aGAngle [

	^ self class radians: (self class radians: aGAngle radians - self radians) radians
]
