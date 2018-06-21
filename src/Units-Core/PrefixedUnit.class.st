"
This is a unit with an SI prefix attached.
See class SIPrefix for details.

"
Class {
	#name : #PrefixedUnit,
	#superclass : #Unit,
	#instVars : [
		'prefix',
		'unit'
	],
	#category : #'Units-Core'
}

{ #category : #'instance creation' }
PrefixedUnit class >> prefix: prefix unit: unit [
	^self new prefix: prefix unit: unit
]

{ #category : #'instance creation' }
PrefixedUnit class >> prefixName: prefixName unit: unit [
	| prefix |
	prefix := SIPrefix named: prefixName.
	^self prefix: prefix unit: unit
]

{ #category : #comparing }
PrefixedUnit >> = anotherUnit [
	self class == anotherUnit class ifFalse: [^false].
	^prefix = anotherUnit prefix and: [unit = anotherUnit unit]
]

{ #category : #conversion }
PrefixedUnit >> baseUnits [
	^unit baseUnits
]

{ #category : #consistency }
PrefixedUnit >> consistentWith: anotherUnit [
	"Short-circuit the double dispatching; just compare the actual unit."
	^anotherUnit consistentWith: unit
]

{ #category : #consistency }
PrefixedUnit >> consistentWithAnything: anotherUnit [
	^unit consistentWith: anotherUnit
]

{ #category : #conversion }
PrefixedUnit >> conversionFactor [
	^prefix scalingFactor * unit conversionFactor
]

{ #category : #comparing }
PrefixedUnit >> hash [
	^prefix hash bitXor: unit hash
]

{ #category : #accessing }
PrefixedUnit >> prefix [
	^prefix
]

{ #category : #initialization }
PrefixedUnit >> prefix: myPrefix unit: myUnit [
	prefix := myPrefix.
	unit := myUnit
]

{ #category : #conversion }
PrefixedUnit >> prefixedBy: prefixName [
	^self error: 'This unit already has a prefix.'
]

{ #category : #printing }
PrefixedUnit >> printAbbreviationOn: stream [
	stream nextPutAll: prefix abbreviation.
	unit printAbbreviationOn: stream
]

{ #category : #printing }
PrefixedUnit >> printFullNameOn: stream pluralized: pluralized [
	stream nextPutAll: prefix name.
	unit printFullNameOn: stream pluralized: pluralized
]

{ #category : #accessing }
PrefixedUnit >> unit [
	^unit
]
