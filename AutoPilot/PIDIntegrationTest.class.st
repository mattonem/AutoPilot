Class {
	#name : #PIDIntegrationTest,
	#superclass : #TestCase,
	#category : #'AutoPilot-Tests'
}

{ #category : #tests }
PIDIntegrationTest >> testProportionalIntegralResponse [

	| system errCal ap |
	errCal := CompassErrorCalculator new
		          headingValue: 0 degrees;
		          course: 10 degrees;
		          yourself.
	system := AngularMockComplexeSystem new
		          output: 0 degrees;
		          k: 1;
		          s: 1 degrees;
		          yourself.
	ap := PIDController new
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
PIDIntegrationTest >> testProportionalResponse [

	| system errCal ap |
	errCal := CompassErrorCalculator new
		          headingValue: 0 degrees;
		          course: 10 degrees;
		          yourself.
	system := AngularMockComplexeSystem new
		          output: 0 degrees;
		          k: 1;
		          yourself.
	ap := PIDController new
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
PIDIntegrationTest >> testWithNoStearing [

	| system errCal ap |
	errCal := CompassErrorCalculator new
		          headingValue: 0 degrees;
		          course: 1 degrees;
		          yourself.
	system := AngularMockComplexeSystem new
		          output: 0 degrees;
		          yourself.
	ap := PIDController new
		      kp: 1;
		      ki: 0;
		      kd: 0;
		      yourself.
	system input: (ap step: (errCal headingValue: 0 degrees)).
	self assert: system output equals: 0 degrees
]

{ #category : #tests }
PIDIntegrationTest >> testZigZag [

	| system errCal ap |
	errCal := CompassErrorCalculator new
		          headingValue: 0 degrees;
		          course: 0 degrees;
		          yourself.
	system := AngularMockComplexeSystem new
		          output: 0 degrees;
		          k: 1;
		          s: 0.5 degrees;
		          yourself.
	ap := PIDController new
		      kp: 1;
		      ki: 1;
		      kd: 0;
		      yourself.

	1 to: 10000 do: [ :i | 
		system input: (ap step: errCal headingValue).
		errCal course: 90 * (i * 0.1) degrees sin degrees.
		self
			assert: (errCal headingValue: system output)
			closeTo: 0
			precision: 1 ]
]
