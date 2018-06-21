"
This is a kind of unit with a specific (singular and plural) name, and an abbreviation. e.g., meter, meters, m.

"
Class {
	#name : #NamedUnit,
	#superclass : #Unit,
	#instVars : [
		'abbreviation',
		'name',
		'pluralName'
	],
	#classVars : [
		'UnitsByAbbreviation',
		'UnitsByName',
		'UnitsByPluralName'
	],
	#category : #'Units-Core'
}

{ #category : #'instance creation' }
NamedUnit class >> abbreviation: abbreviation name: unitName pluralName: pluralName [
	"Create and index a new NamedUnit."
	| unit |
	unit := self new
		abbreviation: abbreviation
		name: unitName
		pluralName: pluralName.
	UnitsByAbbreviation at: abbreviation put: unit.
	UnitsByName at: unitName put: unit.
	UnitsByPluralName at: pluralName put: unit.
	^unit
]

{ #category : #'instance creation' }
NamedUnit class >> abbreviation: abbreviation name: unitName pluralName: pluralName value: unitValue [
	^DerivedUnit
		abbreviation: abbreviation
		name: unitName
		pluralName: pluralName
		value: unitValue
]

{ #category : #'instance creation' }
NamedUnit class >> abbreviation: abbreviation
name: unitName
pluralName: pluralName
value: unitValue
additiveFactor: additiveFactor [
	^TemperatureUnit
		abbreviation: abbreviation
		name: unitName
		pluralName: pluralName
		value: unitValue
		additiveFactor: additiveFactor
]

{ #category : #initialization }
NamedUnit class >> initializeAreaUnits [
	self
		abbreviation: 'acre'
		name: 'acre'
		pluralName: 'acres'
		value: (4046.87260987 units: Unit metre squared).
	self
		abbreviation: 'a'
		name: 'are'
		pluralName: 'ares'
		value: (100 units: Unit metre squared)
]

{ #category : #initialization }
NamedUnit class >> initializeClass [
	"NamedUnit initializeClass."
	"Do not rename this to #initialize."
	UnitsByAbbreviation := Dictionary new.
	UnitsByName := Dictionary new.
	UnitsByPluralName := Dictionary new.
	self initializeUnits
]

{ #category : #initialization }
NamedUnit class >> initializeForceUnits [
	self
		abbreviation: 'N'
		name: 'newton'
		pluralName: 'newtons'
		value: (1 units: (Unit kilogram * Unit metre) / Unit second squared)
]

{ #category : #initialization }
NamedUnit class >> initializeLengthUnits [
	self
		abbreviation: 'in'
		name: 'inch'
		pluralName: 'inches'
		value: (2.54 units: Unit centimetre).
	self
		abbreviation: 'ft'
		name: 'foot'
		pluralName: 'feet'
		value: (12 units: Unit inch).
	self
		abbreviation: 'yd'
		name: 'yard'
		pluralName: 'yards'
		value: (3 units: Unit foot).
	self
		abbreviation: 'mi'
		name: 'mile'
		pluralName: 'miles'
		value: (5280 units: Unit foot).
	self
		abbreviation: 'nm'
		name: 'nauticalmile'
		pluralName: 'nauticalmiles'
		value: (1852 units: Unit metre).
	self
		abbreviation: 'pt'
		name: 'point'
		pluralName: 'points'
		value: (1/72 units: Unit inch).
	self
		abbreviation: 'pc'
		name: 'pica'
		pluralName: 'picas'
		value: (12 units: Unit point).
	self
		abbreviation: 'px'
		name: 'pixel'
		pluralName: 'pixels'
		value: (0.2635872 units: Unit millimetre).
	self
		abbreviation: 'L'
		name: 'litre'
		pluralName: 'litres'
		value: (1/1000 units: (Unit metre raisedTo: 3)).
	self
		abbreviation: 'ua'
		name: 'astronomical unit'
		pluralName: 'astronomical units'
		value: ((1.49598 raisedTo: 11) units: Unit metre).
	self
		abbreviation: 'angstrom'
		name: 'angstrom'
		pluralName:'angstroms'
		value: (1e-10 units: Unit metre)
]

{ #category : #initialization }
NamedUnit class >> initializeMassUnits [
	"Initialize the mass units."
	
	self
		abbreviation: 't'
		name: 'tonne'
		pluralName: 'tonnes'
		value: (1000 units: Unit kilogram).
	self
		abbreviation: 'lb'
		name: 'pound'
		pluralName: 'pounds'
		value: (0.45359237 units: Unit kilogram).
	self
		abbreviation: 'oz'
		name: 'ounce'
		pluralName: 'ounces'
		value: (1/16 units: Unit pound).
	self
		abbreviation: 'st'
		name: 'stone'
		pluralName: 'stone'
		value: (14 units: Unit pound).
	self
		abbreviation: 'g'
		name: 'gram'
		pluralName: 'grams'
		value: ((1/1000) units: BaseUnit kilogram).
]

{ #category : #initialization }
NamedUnit class >> initializeOtherUnits [

	self
		abbreviation: 'C'
		name: 'coulomb'
		pluralName: 'coulombs'
		value: (1 units: ((Unit second) * (Unit ampere))).
	self
		abbreviation: 'F'
		name: 'farad'
		pluralName: 'farads'
		value: (1 units: ((Unit coulomb) / (Unit ampere))).
	self
		abbreviation: 'W'
		name: 'watt'
		pluralName: 'watts'
		value: (1 units: ((Unit ampere) * (Unit volt))).
		
	DerivedUnit
		abbreviation: 'deg'
		name: 'arcdegree'
		pluralName: 'arcdegrees'
		value: (1 degreesToRadians units: Unit radian).
]

{ #category : #initialization }
NamedUnit class >> initializeTemperatureUnits [
	TemperatureBaseUnit
		abbreviation: 'K'
		name: 'kelvin'
		pluralName: 'kelvins'.
	self
		abbreviation: '°F'
		name: 'degree Fahrenheit'
		pluralName: 'degrees Fahrenheit'
		value: (5/9 units: Unit kelvin)
		additiveFactor: -459.67.
	self
		abbreviation: '°C'
		name: 'degree Celsius'
		pluralName: 'degrees Celsius'
		value: (1 units: Unit kelvin)
		additiveFactor: -273.15
]

{ #category : #initialization }
NamedUnit class >> initializeTimeUnits [
	self
		abbreviation: 'min'
		name: 'minute'
		pluralName: 'minutes'
		value: (60 units: Unit second).
	self
		abbreviation: 'h'
		name: 'hour'
		pluralName: 'hours'
		value: (60 units: Unit minute).
	self
		abbreviation: 'd'
		name: 'day'
		pluralName: 'days'
		value: (24 units: Unit hour).
	self
		abbreviation: 'yr'
		name: 'year'
		pluralName: 'years'
		value: (365.25 units: Unit day). "use Julian year"
	self
		abbreviation: 'Hz'
		name: 'hertz'
		pluralName: 'hertz'
		value: 1 / (1 units: Unit second)
]

{ #category : #initialization }
NamedUnit class >> initializeUnits [

	self
		initializeAreaUnits;
		initializeLengthUnits;
		initializeMassUnits;
		initializeForceUnits;
		initializeTemperatureUnits;
		initializeTimeUnits;
		initializeOtherUnits
]

{ #category : #accessing }
NamedUnit class >> withAbbreviation: abbreviation ifAbsent: exceptionBlock [
	^UnitsByAbbreviation
		at: abbreviation
		ifAbsent: exceptionBlock
]

{ #category : #accessing }
NamedUnit class >> withPluralName: pluralName ifAbsent: exceptionBlock [
	^UnitsByPluralName
		at: pluralName
		ifAbsent: exceptionBlock
]

{ #category : #accessing }
NamedUnit class >> withSingularName: unitName ifAbsent: exceptionBlock [
	^UnitsByName
		at: unitName
		ifAbsent: exceptionBlock
]

{ #category : #accessing }
NamedUnit >> abbreviation [
	^abbreviation
]

{ #category : #initialization }
NamedUnit >> abbreviation: myAbbreviation name: myName pluralName: myPluralName [
	abbreviation := myAbbreviation.
	name := myName.
	pluralName := myPluralName
]

{ #category : #accessing }
NamedUnit >> name [
	^name
]

{ #category : #accessing }
NamedUnit >> pluralName [
	^pluralName
]

{ #category : #printing }
NamedUnit >> printAbbreviationOn: stream [
	stream nextPutAll: abbreviation
]

{ #category : #printing }
NamedUnit >> printFullNameOn: stream pluralized: pluralized [
	pluralized
		ifTrue: [stream nextPutAll: pluralName]
		ifFalse: [stream nextPutAll: name]
]

{ #category : #printing }
NamedUnit >> storeOn: aStream [
	"Store the code to lookup the receiver instead of for a new instance."
	
	aStream
		nextPutAll: '(NamedUnit withPluralName: ''';
		nextPutAll: self pluralName;
		nextPutAll: ''')'
]
