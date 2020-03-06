Class {
	#name : #ExpandItem,
	#superclass : #Object,
	#category : #SpecExpandableListPrototype
}

{ #category : #'reflective operations' }
ExpandItem >> doesNotUnderstand: aMessage [
	^ self message
]

{ #category : #accessing }
ExpandItem >> message [
	^ '(Expand)'
]
