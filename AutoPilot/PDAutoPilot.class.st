Class {
	#name : #PDAutoPilot,
	#superclass : #AutoPilot,
	#instVars : [
		'kd',
		'kp',
		'lastError'
	],
	#category : #AutoPilot
}

{ #category : #accessing }
PDAutoPilot >> kd: anObject [

	kd := anObject
]

{ #category : #accessing }
PDAutoPilot >> kp: anObject [

	kp := anObject
]

{ #category : #stepping }
PDAutoPilot >> step [

	| error derror |
	error := courseToFollow - headingSensor headingValue.
	Transcript
		show: error degreeNumber asString;
		cr.
	lastError ifNil: [ lastError := error ].
	derror := lastError - error.
	lastError := error.
	stearingActuator stearingValue: kp * error + (kd * derror)
]
