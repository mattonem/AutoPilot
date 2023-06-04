Class {
	#name : #PIDController,
	#superclass : #Controller,
	#instVars : [
		'kd',
		'kp',
		'ki',
		'lastError',
		'ei',
		'corrMax',
		'lastUpdateTime'
	],
	#category : #'AutoPilot-Core'
}

{ #category : #accessing }
PIDController >> corrMax: anObject [

	corrMax := anObject
]

{ #category : #stepping }
PIDController >> initialize [ 
	corrMax := Float infinity 
]

{ #category : #accessing }
PIDController >> kd: anObject [

	kd := anObject
]

{ #category : #accessing }
PIDController >> ki: anObject [

	ki := anObject
]

{ #category : #accessing }
PIDController >> kp: anObject [

	kp := anObject
]

{ #category : #stepping }
PIDController >> step: newError [

	lastUpdateTime ifNil: [ lastUpdateTime := 0 ].
	^ self step: newError newTime: lastUpdateTime + 1
]

{ #category : #stepping }
PIDController >> step: newError newTime: aTime [

	| derror corr dTime |
	lastUpdateTime ifNil: [ lastUpdateTime := aTime  + 1 ].
	dTime := aTime - lastUpdateTime.
	lastUpdateTime := aTime.

	lastError ifNil: [ lastError := newError ].
	ei ifNil: [ ei := newError - newError ].
	ei := ei + (dTime * newError).
	ei := { 
		      { 
			      ei.
			      (corrMax) } min.
		      (0 - corrMax) } max.
	derror := lastError - newError / dTime.
	lastError := newError.
	corr := kp * newError + (kd * derror) + (ki * ei).
	^ { 
		  { 
			  corr.
			  corrMax } min.
		  (0 - corrMax) } max
]

{ #category : #accessing }
PIDController >> ti: anObject [

	ki := 1/anObject * kp
]

{ #category : #'as yet unclassified' }
PIDController >> tunePIDkCrit: kCrit tCrit: tCrit [

	^ self
		  kp: 0.6 * tCrit;
		  ti: 0.5 * tCrit;
		  kd: 0.125 * tCrit;
		  yourself
]

{ #category : #'as yet unclassified' }
PIDController >> tunePIkCrit: kcrit tCrit: tcrit [

	self
		kp: kcrit * 0.45;
		ti: 1.2 * tcrit ;
		kd: 0;
		yourself
]

{ #category : #'as yet unclassified' }
PIDController >> tunePkCrit: kCrit tCrit: tCrit [

	^ self
		  kp: 0.5 * kCrit;
		  ki: 0;
		  kd: 0;
		  yourself
]
