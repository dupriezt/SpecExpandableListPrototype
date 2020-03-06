"
I am a baseline to define the structure and dependencies of the SpecAppSkeleton project.
"
Class {
	#name : #BaselineOfSpecExpandableListPrototype,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpecExpandableListPrototype
}

{ #category : #baseline }
BaselineOfSpecExpandableListPrototype >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'SpecExpandableListPrototype'.
			"Groups"
			spec
				group: 'Core' with: #('SpecExpandableListPrototype')].
]

{ #category : #accessing }
BaselineOfSpecExpandableListPrototype >> projectClass [
	^ MetacelloCypressBaselineProject
]
