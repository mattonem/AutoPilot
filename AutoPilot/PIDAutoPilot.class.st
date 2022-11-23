Class {
	#name : #PIDAutoPilot,
	#superclass : #AutoPilot,
	#instVars : [
		'kd',
		'kp',
		'ki',
		'lastError',
		'ei'
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
PIDAutoPilot >> step [

	| error derror |
	error := courseToFollow - headingSensor headingValue.
"	Transcript
		show: error degreeNumber asString;
		cr."
	lastError ifNil: [ lastError := error ].

	ei ifNil: [ ei := error - error ].
	ei := ei + error.
		Transcript
		show: (ei + (180 degrees)) degreeNumber asString;
		cr.
	derror := lastError - error.
	lastError := error.
	stearingActuator stearingValue: kp * error + (kd * derror) + (ki * ei)
]
