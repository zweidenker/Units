"
A base unit with an arbitrary modification that makes it incompatible
with anything that does not have the same modification.  Works well with domain-specific
'modifications', e.g.,
	1.6 moles
can now become:
	1.6 moles of sulfuric acid

(""sulfuric acid"" might be a String, or a ChemicalCompound, or whatever.)

"
Class {
	#name : #ModifiedUnit,
	#superclass : #Unit,
	#instVars : [
		'baseUnit',
		'modification'
	],
	#category : #'Units-Core'
}

{ #category : #'instance creation' }
ModifiedUnit class >> baseUnit: baseUnit modification: modification [
	^self new
		baseUnit: baseUnit
		modification: modification
]

{ #category : #comparing }
ModifiedUnit >> = anotherUnit [
	self class = anotherUnit class ifFalse: [^false].
	modification = anotherUnit modification ifFalse: [^false].
	^baseUnit = anotherUnit baseUnit
]

{ #category : #accessing }
ModifiedUnit >> baseUnit [
	^baseUnit
]

{ #category : #initialization }
ModifiedUnit >> baseUnit: myBaseUnit modification: myModification [
	baseUnit := myBaseUnit.
	modification := myModification
]

{ #category : #conversion }
ModifiedUnit >> baseUnits [
	^self
]

{ #category : #consistency }
ModifiedUnit >> consistentWith: anotherUnit [
	^anotherUnit consistentWithModifiedUnit: self
]

{ #category : #consistency }
ModifiedUnit >> consistentWithBaseUnit: anotherBaseUnit [
	^false
]

{ #category : #consistency }
ModifiedUnit >> consistentWithComplexUnit: complexUnit [
	^self consistentWith: complexUnit baseUnits
]

{ #category : #consistency }
ModifiedUnit >> consistentWithCompoundUnit: compoundUnit [
	^false
]

{ #category : #consistency }
ModifiedUnit >> consistentWithModifiedUnit: modifiedUnit [
	self class == modifiedUnit class ifFalse: [^false].
	^baseUnit = modifiedUnit baseUnit
		and: [modification = modifiedUnit modification]
]

{ #category : #conversion }
ModifiedUnit >> conversionFactor [
	^baseUnit conversionFactor
]

{ #category : #comparing }
ModifiedUnit >> hash [
	^modification hash bitXor: baseUnit hash
]

{ #category : #predicates }
ModifiedUnit >> isBaseUnit [
	"ModifiedUnits are effectively new base units..."
	^true
]

{ #category : #accessing }
ModifiedUnit >> modification [
	^modification
]

{ #category : #printing }
ModifiedUnit >> printAbbreviationOn: stream [
	baseUnit printAbbreviationOn: stream.
	stream nextPut: $(.
	modification isString
		ifTrue: [stream nextPutAll: modification]
		ifFalse: [stream print: modification].
	stream nextPut: $)
]

{ #category : #printing }
ModifiedUnit >> printFullNameOn: stream pluralized: pluralized [
	baseUnit printFullNameOn: stream pluralized: pluralized.
	stream nextPutAll: ' (of '.
	"Can't avoid the #isString, since strings print differently than other objects,
	 and it is valid to have non-strings as the modification."
	modification isString
		ifTrue: [stream nextPutAll: modification]
		ifFalse: [stream print: modification].
	stream nextPut: $)
]
