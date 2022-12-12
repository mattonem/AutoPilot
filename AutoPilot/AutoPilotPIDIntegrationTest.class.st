Class {
	#name : #AutoPilotPIDIntegrationTest,
	#superclass : #TestCase,
	#category : #'AutoPilot-Tests'
}

{ #category : #tests }
AutoPilotPIDIntegrationTest >> testProportionalIntegralResponse [

	| system errCal ap |
	errCal := ErrorCalculator new
		          headingValue: 0 degrees;
		          course: 10 degrees;
		          yourself.
	system := MockComplexeSystem new
		          output: 0 degrees;
		          k: 0.1;
		          s: 1 degrees;
		          yourself.
	ap := PIDAutoPilot new
		      kp: 1;
		      ki: 1;
		      kd: 0;
		      yourself.
	100 timesRepeat: [ 
		system input: (ap step: errCal headingValue).
		errCal headingValue: system output ].

	200 timesRepeat: [ 
		system input: (ap step: errCal headingValue).
		errCal headingValue: system output.
		self assert: system output degreeNumber closeTo: 10 precision: 0.1 ]
]

{ #category : #tests }
AutoPilotPIDIntegrationTest >> testProportionalResponse [

	| system errCal ap |
	errCal := ErrorCalculator new
		          headingValue: 0 degrees;
		          course: 10 degrees;
		          yourself.
	system := MockComplexeSystem new
		          output: 0 degrees;
		          k: 0.1;
		          yourself.
	ap := PIDAutoPilot new
		      kp: 1;
		      ki: 0;
		      kd: 0;
		      yourself.
	100 timesRepeat: [ 
		system input: (ap step: errCal headingValue).
		errCal headingValue: system output ].

	self assert: system output degreeNumber closeTo: 10
]

{ #category : #tests }
AutoPilotPIDIntegrationTest >> testWithNoStearing [

	| system errCal ap |
	errCal := ErrorCalculator new
		          headingValue: 0 degrees;
		          course: 1 degrees;
		          yourself.
	system := MockComplexeSystem new
		          output: 0 degrees;
		          yourself.
	ap := PIDAutoPilot new
		      kp: 1;
		      ki: 0;
		      kd: 0;
		      yourself.
	system input: (ap step: (errCal headingValue: 0 degrees)).
	self assert: system output equals: 0 degrees
]
