Class {
	#name : #PIDTest,
	#superclass : #TestCase,
	#category : #'AutoPilot-Tests'
}

{ #category : #tests }
PIDTest >> testMaxCorr [

	| ap |
	ap := PIDController new
		      kp: 2;
		      ki: 1;
		      kd: 0;
				corrMax: 1;
		      yourself.
	1 to: 100 do: [:i | self assert: (ap step: 1) equals: 1 ]
]

{ #category : #tests }
PIDTest >> testNoError [

	| ap |
	ap := PIDController new
		      kp: 1;
		      ki: 1;
		      kd: 1;
		      yourself.
	100 timesRepeat: [ self assert: (ap step: 0) equals: 0 ]
]

{ #category : #tests }
PIDTest >> testStaticErrorIntegralResponse [

	| ap |
	ap := PIDController new
		      kp: 0;
		      ki: 1;
		      kd: 0;
		      yourself.
	1 to:100 do: [:i | self assert: (ap step: 1) equals: i ]
]

{ #category : #tests }
PIDTest >> testStaticErrorProportionalResponse [

	| ap |
	ap := PIDController new
		      kp: 1;
		      ki: 0;
		      kd: 0;
		      yourself.
	100 timesRepeat: [ self assert: (ap step: 1) equals: 1 ]
]
