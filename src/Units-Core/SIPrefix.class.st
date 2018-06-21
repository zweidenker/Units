"
SIPrefix represents a power of 10 attached to a unit.
Examples: milli, micro, kilo, etc.

"
Class {
	#name : #SIPrefix,
	#superclass : #Object,
	#instVars : [
		'abbreviation',
		'name',
		'scalingFactor'
	],
	#classVars : [
		'SIPrefixesByAbbreviation',
		'SIPrefixesByName'
	],
	#category : #'Units-Core'
}

{ #category : #initialization }
SIPrefix class >> abbreviation: abbreviation name: prefixName scalingFactor: scalingFactor [
	| prefix |
	prefix := self new
		abbreviation: abbreviation
		name: prefixName
		scalingFactor: scalingFactor.
	SIPrefixesByAbbreviation at: abbreviation put: prefix.
	SIPrefixesByName at: prefixName put: prefix.
	^prefix
]

{ #category : #initialization }
SIPrefix class >> initializeClass [
	"SIPrefix initializeClass."
	"Do not rename this to #initialize."
	SIPrefixesByName := Dictionary new.
	SIPrefixesByAbbreviation := Dictionary new.
	self abbreviation: 'y' name: 'yocto' scalingFactor: (10 raisedTo: -24).
	self abbreviation: 'z' name: 'zepto' scalingFactor: (10 raisedTo: -21).
	self abbreviation: 'a' name: 'atto' scalingFactor: (10 raisedTo: -18).
	self abbreviation: 'f' name: 'femto' scalingFactor: (10 raisedTo: -15).
	self abbreviation: 'p' name: 'pico' scalingFactor: (10 raisedTo: -12).
	self abbreviation: 'n' name: 'nano' scalingFactor: (10 raisedTo: -9).
	self abbreviation: 'u' name: 'micro' scalingFactor: (10 raisedTo: -6).
	self abbreviation: 'm' name: 'milli' scalingFactor: (10 raisedTo: -3).
	self abbreviation: 'c' name: 'centi' scalingFactor: (10 raisedTo: -2).
	self abbreviation: 'd' name: 'deci' scalingFactor: (10 raisedTo: -1).
	self abbreviation: 'da' name: 'deka' scalingFactor: (10 raisedTo: 1).
	self abbreviation: 'h' name: 'hecto' scalingFactor: (10 raisedTo: 2).
	self abbreviation: 'k' name: 'kilo' scalingFactor: (10 raisedTo: 3).
	self abbreviation: 'M' name: 'mega' scalingFactor: (10 raisedTo: 6).
	self abbreviation: 'G' name: 'giga' scalingFactor: (10 raisedTo: 9).
	self abbreviation: 'T' name: 'tera' scalingFactor: (10 raisedTo: 12).
	self abbreviation: 'P' name: 'peta' scalingFactor: (10 raisedTo: 15).
	self abbreviation: 'E' name: 'exa' scalingFactor: (10 raisedTo: 18).
	self abbreviation: 'Z' name: 'zetta' scalingFactor: (10 raisedTo: 21).
	self abbreviation: 'Y' name: 'yotta' scalingFactor: (10 raisedTo: 24)
]

{ #category : #accessing }
SIPrefix class >> named: prefixName [
	^SIPrefixesByName at: prefixName
]

{ #category : #enumerating }
SIPrefix class >> prefixAbbreviationsDo: block [
	"Evaluate 'block' once with each prefix abbreviation, in no particular order."
	SIPrefixesByAbbreviation keysDo: block
]

{ #category : #enumerating }
SIPrefix class >> prefixStringsDo: block [
	"Evaluate 'block' once with each prefix string, in no particular order."
	SIPrefixesByName keysDo: block
]

{ #category : #accessing }
SIPrefix class >> withAbbreviation: abbreviation [
	^SIPrefixesByAbbreviation at: abbreviation
]

{ #category : #accessing }
SIPrefix >> abbreviation [
	^abbreviation
]

{ #category : #initialization }
SIPrefix >> abbreviation: myAbbreviation name: myName scalingFactor: myScalingFactor [
	abbreviation := myAbbreviation.
	name := myName.
	scalingFactor := myScalingFactor
]

{ #category : #accessing }
SIPrefix >> name [
	^name
]

{ #category : #printing }
SIPrefix >> printOn: stream [
	super printOn: stream.
	stream
		nextPutAll: ' [';
		nextPutAll: name;
		nextPut: $]
]

{ #category : #accessing }
SIPrefix >> scalingFactor [
	^scalingFactor
]

{ #category : #printing }
SIPrefix >> storeOn: aStream [
	"Store the code to lookup the receiver instead of for a new instance."
	
	aStream
		nextPutAll: '(SIPrefix named: ''';
		nextPutAll: name;
		nextPutAll: ''')'
]
