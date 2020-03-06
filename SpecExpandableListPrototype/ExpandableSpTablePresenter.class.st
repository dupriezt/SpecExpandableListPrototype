Class {
	#name : #ExpandableSpTablePresenter,
	#superclass : #SpTablePresenter,
	#instVars : [
		'expanded',
		'predicateToFindExpandPoint',
		'indexOfExpandPoint',
		'fullCollection'
	],
	#category : #SpecExpandableListPrototype
}

{ #category : #controlling }
ExpandableSpTablePresenter >> expand [
	expanded := true.
	self items: fullCollection.
]

{ #category : #accessing }
ExpandableSpTablePresenter >> expanded [
	^ expanded
]

{ #category : #initialization }
ExpandableSpTablePresenter >> initialize [
	super initialize.
	expanded := false.
	self
		whenSelectionChangedDo: [ :selection | 
			(self selection selectedIndex = indexOfExpandPoint) & (expanded not)
				ifTrue: [ self expand ] ]
]

{ #category : #api }
ExpandableSpTablePresenter >> items: aCollection [

	| indexOfExpandPoint_temp newCollection |
	self expanded ifFalse: [ "Only check for inserting an expand point if the list has not been expanded already"
		self predicateToFindExpandPoint ifNotNil: [ :predicate |
			indexOfExpandPoint_temp := aCollection findLast: self predicateToFindExpandPoint.
			(indexOfExpandPoint_temp ~= 0) ifTrue: [
				"The predicate evaluates as true for an object of @aCollection"
				fullCollection := aCollection.
				indexOfExpandPoint := indexOfExpandPoint_temp.
				newCollection := aCollection copyFrom: 1 to: indexOfExpandPoint - 1. "-1 to remove the also remove the element that is at the expand point"
				newCollection addLast: ExpandItem new.
				super items: newCollection.
				^ true
			]
		]
	].
	"Either the predicate block was nil, or no object of @aCollection satisfied it"
	super items: aCollection.
]

{ #category : #accessing }
ExpandableSpTablePresenter >> predicateToFindExpandPoint [
	^ predicateToFindExpandPoint
]

{ #category : #accessing }
ExpandableSpTablePresenter >> predicateToFindExpandPoint: aBlock [
	predicateToFindExpandPoint := aBlock
]
