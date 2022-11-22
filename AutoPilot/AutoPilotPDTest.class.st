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
	ap kp: 1.
	ap kd: 1.
	ap stearingActuator: stearing.
	^ ap
]

{ #category : #tests }
AutoPilotPDTest >> test1 [

	| ap stearing heading |
	heading := HeadingMock constant: (Point r: 1 theta: 0degrees).
	stearing := StearingMock startAt: (Point r: 1 theta: 0degrees).
	ap := self newApWithStearing: stearing andHeading: heading courseToFollow: (Point r: 1 theta: 0degrees).
	100 timesRepeat: [ 
		ap step.
		self assert: stearing stearingValue equals: (Point r: 1 theta: 0degrees) ]
]

{ #category : #tests }
AutoPilotPDTest >> test2 [

	| ap stearing heading oldStearingValue |
	heading := HeadingMock valuesFrom:
		           ((1 to: 100) collect: [ :i | 
			            Point r: 1 theta: (20 - (20 / i)) degrees ]).
	stearing := StearingMock startAt: (Point r: 1 theta: 0 degrees).
	oldStearingValue := stearing stearingValue.
	ap := self
		      newApWithStearing: stearing
		      andHeading: heading
		      courseToFollow: (Point r: 1 theta: 20 degrees).

	1 to: 100 do: [ :i | 
		| ds |
		ap step.
		ds := oldStearingValue - stearing stearingValue.
		oldStearingValue := stearing stearingValue.
		Transcript
			show: 'i: ' , i asString , ' delta stearing: ' , ds r asString;
			cr ]
]
