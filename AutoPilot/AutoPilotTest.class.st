"
An AutoPilotTest is a test class for testing the behavior of AutoPilot
"
Class {
	#name : #AutoPilotTest,
	#superclass : #TestCase,
	#category : #'AutoPilot-Tests'
}

{ #category : #tests }
AutoPilotTest >> test1 [

	| ap stearing |
	ap := AutoPilot new.
	ap courseToFollow: 0 degrees.
	ap headingSensor: (HeadingMock constant: 0 degrees).
	ap minStearingDThreshold: 1 degrees.
	ap stearingIncrement: 1 degrees.
	ap maxStearingIncrement: 40 degrees.
	ap stearingActuator: (stearing := StearingMock startAt: 0 degrees).
	100 timesRepeat: [ 
		ap step.
		self assert: stearing stearingValue equals: 0 degrees]
]

{ #category : #tests }
AutoPilotTest >> test2 [

	| ap stearing |
	ap := AutoPilot new.
	ap courseToFollow: 0 degrees.
	ap headingSensor: (HeadingMock constant: 20 degrees).
	ap minStearingDThreshold: 1 degrees.
	ap stearingIncrement: 1 degrees.
	ap maxStearingIncrement: 40 degrees.
	ap stearingActuator: (stearing := StearingMock startAt: 0 degrees).
	(1 to: 10) do: [ :i | 
		ap step.
		self assert: stearing stearingValue equals: i degrees ]
]

{ #category : #tests }
AutoPilotTest >> test3 [

	| ap stearing |
	ap := AutoPilot new.
	ap courseToFollow: 0 degrees.
	ap headingSensor: (HeadingMock constant: 20 degrees).
	ap minStearingDThreshold: 1 degrees.
	ap stearingIncrement: 1 degrees.
	ap maxStearingIncrement: 40 degrees.
	ap stearingActuator: (stearing := StearingMock startAt: 0 degrees).
	100 timesRepeat: [ ap step ].
	(1 to: 10) do: [ :i | 
		ap step.
		self assert: stearing stearingValue equals: 40 degrees ]
]

{ #category : #tests }
AutoPilotTest >> test4 [

	| ap stearing |
	ap := AutoPilot new.
	ap courseToFollow: 0 degrees.
	ap headingSensor: (HeadingMock constant: -20 degrees).
	ap minStearingDThreshold: 1 degrees.
	ap stearingIncrement: 1 degrees.
	ap maxStearingIncrement: 40 degrees.
	ap stearingActuator: (stearing := StearingMock startAt: 0 degrees).
	(1 to: 10) do: [ :i | 
		ap step.
		self assert: stearing stearingValue equals: (0-i) degrees ]
]

{ #category : #tests }
AutoPilotTest >> test5 [

	| ap stearing |
	ap := AutoPilot new.
	ap courseToFollow: 0 degrees.
	ap headingSensor: (HeadingMock constant: -20 degrees).
	ap minStearingDThreshold: 1 degrees.
	ap stearingIncrement: 1 degrees.
	ap maxStearingIncrement: 40 degrees.
	ap stearingActuator: (stearing := StearingMock startAt: 0 degrees).
	100 timesRepeat: [ ap step ].
	(1 to: 10) do: [ :i | 
		ap step.
		self assert: stearing stearingValue equals: -41 degrees ]
]
