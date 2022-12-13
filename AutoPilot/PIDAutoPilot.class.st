Class {
	#name : #PIDAutoPilot,
	#superclass : #AutoPilot,
	#instVars : [
		'kd',
		'kp',
		'ki',
		'lastError',
		'ei',
		'corrMax',
		'lastUpdateTime'
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

	lastUpdateTime ifNil: [ lastUpdateTime := 0 ].
	^ self step: newError newTime: lastUpdateTime + 1
]

{ #category : #stepping }
PIDAutoPilot >> step: newError newTime: aTime [

	| derror corr dTime |
	lastUpdateTime ifNil: [ lastUpdateTime := aTime ].
	dTime := aTime - lastUpdateTime.
	lastUpdateTime := aTime.

	lastError ifNil: [ lastError := newError ].
	ei ifNil: [ ei := newError - newError ].
	ei := ei + (dTime * newError).
	ei := { 
		      { 
			      ei.
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

{ #category : #accessing }
PIDAutoPilot >> ti: anObject [

	ki := 1/anObject
]

{ #category : #'as yet unclassified' }
PIDAutoPilot >> tunePIDkCrit: kCrit tCrit: tCrit [

	^ self
		  kp: 0.6 * tCrit;
		  ti: 0.5 * tCrit * kp;
		  kd: 0.125 * tCrit * kp;
		  yourself
]

{ #category : #'as yet unclassified' }
PIDAutoPilot >> tunePIkCrit: kcrit tCrit: tcrit [

	self
		kp: kcrit * 0.45;
		ti: 1.2 * tcrit * kp;
		kd: 0;
		yourself
]

{ #category : #'as yet unclassified' }
PIDAutoPilot >> tunePkCrit: kCrit tCrit: tCrit [

	^ self
		  kp: 0.5 * kCrit;
		  ki: 0;
		  kd: 0
]
