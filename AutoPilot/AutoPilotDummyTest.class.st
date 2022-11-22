"
An AutoPilotTest is a test class for testing the behavior of AutoPilot
"
Class {
	#name : #AutoPilotDummyTest,
	#superclass : #TestCase,
	#category : #'AutoPilot-Tests'
}

{ #category : #tests }
AutoPilotDummyTest >> newApWithStearing: stearing andHeading: heading courseToFollow: aGangle [

	| ap |
	ap := AutoPilotDummy new.
	ap courseToFollow:aGangle.
	ap headingSensor: heading.
	ap minStearingDThreshold: 1 degrees.
	ap stearingIncrement: 1 degrees.
	ap maxStearingIncrement: 40 degrees.
	ap stearingActuator: stearing.
	^ ap
]

{ #category : #tests }
AutoPilotDummyTest >> test1 [

	| ap stearing heading |
	heading := HeadingMock constant: 0 degrees.
	stearing := StearingMock startAt: 0 degrees.
	ap := self newApWithStearing: stearing andHeading: heading courseToFollow: 0 degrees.
	100 timesRepeat: [ 
		ap step.
		self assert: stearing stearingValue equals: 0 degrees ]
]

{ #category : #tests }
AutoPilotDummyTest >> test2 [

	| ap stearing heading |
	heading := HeadingMock constant: 0 degrees.
	stearing := StearingMock startAt: 0 degrees.
	ap := self newApWithStearing: stearing andHeading: heading courseToFollow: 20 degrees.
	
	(1 to: 10) do: [ :i | 
		ap step.
		self assert: stearing stearingValue equals: (0-i) degrees ]
]

{ #category : #tests }
AutoPilotDummyTest >> test3 [

	| ap stearing heading |
	heading := HeadingMock constant: 0 degrees.
	stearing := StearingMock startAt: 0 degrees.
	ap := self newApWithStearing: stearing andHeading: heading courseToFollow: 20 degrees.
	100 timesRepeat: [ ap step ].
	(1 to: 10) do: [ :i | 
		ap step.
		self assert: stearing stearingValue equals: -41 degrees ]
]

{ #category : #tests }
AutoPilotDummyTest >> test4 [

	| ap stearing heading |
	heading := HeadingMock constant: 0 degrees.
	stearing := StearingMock startAt: 0 degrees.
	ap := self
		      newApWithStearing: stearing
		      andHeading: heading
		      courseToFollow: -20 degrees.
	(1 to: 10) do: [ :i | 
		ap step.
		self assert: stearing stearingValue equals: i degrees ]
]

{ #category : #tests }
AutoPilotDummyTest >> test5 [

	| ap stearing heading |
	heading := HeadingMock constant: 0 degrees.
	stearing := StearingMock startAt: 0 degrees.
	ap := self newApWithStearing: stearing andHeading: heading courseToFollow: -20 degrees.
	100 timesRepeat: [ ap step ].
	(1 to: 10) do: [ :i | 
		ap step.
		self assert: stearing stearingValue equals: 40 degrees ]
]
