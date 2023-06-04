"
```language=Pharo&caption=Roassal Plotter Example&anchor=Fig1
| system errCal ap c p values |
	errCal := ErrorCalculator new
		          headingValue: 0 degrees;
		          course: 0 degrees;
		          yourself.
	system := MockComplexeSystem new
		          output: 0 degrees;
		          k: 1;
		          s: 0.1 degrees;
		          yourself.
	ap := PIDAutoPilot new
		      kp: 0.1;
		      ki: 0.001;
		      kd: 0;
		      yourself.
	headings := OrderedCollection new.
	1 to: 400 do: [ :i | 
		system input: (ap step: errCal headingValue).
		errCal course: 10 * (((i ) < 300) ifTrue: 0 ifFalse: 1) degrees .
		errCal headingValue: system output.
		headings add: system output.
		].

	values := headings collect: [:i | (i + 180 degrees) degreeNumber - 180].
	c := RSChart new.
	p := RSLinePlot new x:(1 to: values size) y: values.
	c addPlot: p.
	c addDecoration: (RSHorizontalTick new doNotUseNiceLabel).
	c addDecoration: (RSVerticalTick new).
	^ c
```
"
Class {
	#name : #Controller,
	#superclass : #Object,
	#instVars : [
		'headingSensor',
		'stearingActuator'
	],
	#category : #AutoPilot
}

{ #category : #'as yet unclassified' }
Controller >> headingSensor: aHeadingMock [ 
	headingSensor := aHeadingMock
]

{ #category : #'as yet unclassified' }
Controller >> stearingActuator: aStearingMock [ 
	stearingActuator := aStearingMock
]

{ #category : #'as yet unclassified' }
Controller >> step: aValue [
	self subclassResponsibility
]
