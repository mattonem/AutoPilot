Class {
	#name : #PIDAutoPilot,
	#superclass : #AutoPilot,
	#instVars : [
		'kd',
		'kp',
		'ki',
		'lastError',
		'ei',
		'corrMax'
	],
	#category : #AutoPilot
}

{ #category : #accessing }
PIDAutoPilot >> corrMax: anObject [

	corrMax := anObject
]

{ #category : #stepping }
PIDAutoPilot >> initialize [ 
	corrMax := Float infinity 
]

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

	| derror corr |
	lastError ifNil: [ lastError := newError ].
	ei ifNil: [ ei := newError - newError ].
	ei := { 
		      { 
			      (ei + newError).
			      (corrMax / 2) } min.
		      (0 - corrMax / 2) } max.
	derror := lastError - newError.
	lastError := newError.
	corr := kp * newError + (kd * derror) + (ki * ei).
	^ { 
		  { 
			  corr.
			  corrMax } min.
		  (0 - corrMax) } max
]
