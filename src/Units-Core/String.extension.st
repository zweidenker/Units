Extension { #name : #String }

{ #category : #'*Units-Core' }
String >> asUnit [
	"Answer the receiver as a unit."
	
	^UnitValue unitFor: self asSymbol
]

{ #category : #'*Units-Core' }
String >> asUnitValue [
	"Answer the receiver as a unit value."
	
	|n p i|
	n := self asNumber.
	i := self findString: (p := n printString).
	i = 0 ifTrue: [^nil].
	^n units: (self allButFirst: p size) withBlanksTrimmed asUnit
	
]
