Class {
	#name : #AutoPilotPIDTest,
	#superclass : #TestCase,
	#category : #'AutoPilot-Tests'
}

{ #category : #tests }
AutoPilotPIDTest >> testNoError [

	| ap |
	ap := PIDAutoPilot new
		      kp: 1;
		      ki: 1;
		      kd: 1;
		      yourself.
	100 timesRepeat: [ self assert: (ap step: 0) equals: 0 ]
]

{ #category : #tests }
AutoPilotPIDTest >> testStaticErrorIntegralResponse [

	| ap |
	ap := PIDAutoPilot new
		      kp: 0;
		      ki: 1;
		      kd: 0;
		      yourself.
	1 to:100 do: [:i | self assert: (ap step: 1) equals: i ]
]

{ #category : #tests }
AutoPilotPIDTest >> testStaticErrorProportionalResponse [

	| ap |
	ap := PIDAutoPilot new
		      kp: 1;
		      ki: 0;
		      kd: 0;
		      yourself.
	100 timesRepeat: [ self assert: (ap step: 1) equals: 1 ]
]
