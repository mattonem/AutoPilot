"
```language=Pharo&caption=Roassal Plotter Example&anchor=Fig1

errorCal := CompassErrorCalculator new
	headingValue: 0 degrees;
	course: 40 degrees;
	yourself.

system := AngularMockComplexeSystem new
    output: 0 degrees;
    k: 0.5;
    s: 1 degrees;
    yourself.

ap := PIDController new
    kp: 0.1;
    ki: 0.05;
    kd: 0.04;
	 corrMax: 30;
    yourself.

headings := OrderedCollection new.
1 to: 1000 do: [ :i | |corr|
	corr := ap step: (errorCal headingValue: system output).
	system input: corr.
	headings add: system output.
	].

values := headings collect: [:i | (i + 180 degrees) degreeNumber - 180].

c := RSChart new.
	
p := RSLinePlot new x:(1 to: values size) y: values.
c addPlot: p.

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
	#category : #'AutoPilot-Core'
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
