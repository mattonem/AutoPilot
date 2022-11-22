Class {
	#name : #AutoPilotPDTest,
	#superclass : #TestCase,
	#category : #'AutoPilot-Tests'
}

{ #category : #tests }
AutoPilotPDTest >> newApWithStearing: stearing andHeading: heading courseToFollow: aGangle [

	| ap |
	ap := PDAutoPilot new.
	ap courseToFollow: aGangle.
	ap headingSensor: heading.
	ap kp: 0.2.
	ap kd: 0.1.
	ap stearingActuator: stearing.
	^ ap
]

{ #category : #tests }
AutoPilotPDTest >> test1 [

	| ap stearing heading |
	heading := HeadingMock constant: (RelativeAngle degrees: 0).
	stearing := StearingMock startAt: (RelativeAngle degrees: 0).
	ap := self
		      newApWithStearing: stearing
		      andHeading: heading
		      courseToFollow: (RelativeAngle degrees: 0).
	100 timesRepeat: [ 
		ap step.
		self
			assert: stearing stearingValue degreeNumber 
			equals: 0 ]
]

{ #category : #tests }
AutoPilotPDTest >> test2 [

	| ap stearing heading oldStearingValue |
	heading := HeadingMock valuesFrom:
		           ((1 to: 200) collect: [ :i | 
			            RelativeAngle degrees: 20 - (20 / i) ]).
	stearing := StearingMock startAt: (RelativeAngle degrees: 0).
	oldStearingValue := stearing stearingValue.
	ap := self
		      newApWithStearing: stearing
		      andHeading: heading
		      courseToFollow: (RelativeAngle degrees: 20).

	1 to: 100 do: [ :i | 
		ap step.
		oldStearingValue := stearing stearingValue ].


	1 to: 100 do: [ :i | 
		| ds |
		ap step.
		ds := oldStearingValue - stearing stearingValue.
		oldStearingValue := stearing stearingValue.
		self assert: ds degreeNumber closeTo: 0 precision: 0.01 ]
]

{ #category : #tests }
AutoPilotPDTest >> test3 [

	| ap stearing heading oldStearingValue |
	stearing := StearingMock startAt:  (RelativeAngle degrees: 0).
	heading := HeadingMock stearing: stearing.
	oldStearingValue := stearing stearingValue.
	ap := self
		      newApWithStearing: stearing
		      andHeading: heading
		      courseToFollow:  (RelativeAngle degrees: 45).

	1 to: 100 do: [ :i | 
		ap step.
		oldStearingValue := stearing stearingValue.
		"Transcript show:  heading headingValue theta radiansToDegrees asString ;cr"].


	1 to: 100 do: [ :i | 
		| ds |
		ap step.
		ds := oldStearingValue - stearing stearingValue.
		oldStearingValue := stearing stearingValue.
		self assert: ds degreeNumber closeTo: 0 precision: 0.01 ]
]
