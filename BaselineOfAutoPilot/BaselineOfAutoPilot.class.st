Class {
	#name : #BaselineOfAutoPilot,
	#superclass : #BaselineOf,
	#category : #BaselineOfAutoPilot
}

{ #category : #baselines }
BaselineOfAutoPilot >> baseline: spec [

	<baseline>
	spec for: #common do: [ spec package: #Controller ]
]
