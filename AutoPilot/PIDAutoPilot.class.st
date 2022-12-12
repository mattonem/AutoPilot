Class {
	#name : #PIDAutoPilot,
	#superclass : #AutoPilot,
	#instVars : [
		'kd',
		'kp',
		'ki',
		'lastError',
		'ei',
		'maxError'
	],
	#category : #AutoPilot
}

{ #category : #accessing }
PIDAutoPilot >> kd: anObject [

	kd := anObject
]

{ #category : #accessing }
PIDAutoPilot >> ki: anObject [

	ki := anObject
]

{ #category : #accessing }
PIDAutoPilot >> kp: anObject [

	kp := anObject
]

{ #category : #stepping }
PIDAutoPilot >> step: newError [

	| derror |
	lastError ifNil: [ lastError := newError ].
	ei ifNil: [ ei := newError - newError ].
	ei := ei + newError.
	derror := lastError - newError.
	lastError := newError.
	^ kp * newError + (kd * derror) + (ki * ei)
]
