"
Class Unit is the superclass for all other unit classes.
Instances represent units which are attached to numbers; for example
'meters' (a BaseUnit), 'meters per second' (a CompoundUnit),
'joule seconds per liter' (a ComplexUnit), 'degrees Kelvin' (a TemperatureBaseUnit),
'degrees Celsius' (a TemperatureUnit), 'kilohertz' (a PrefixedUnit),
and 'moles of hydrogen' (a ModifiedUnit).

A number of methods on the class side of Unit provide for easy access to built-in units.

The basic unit 'kilogram' is special given that it is basic and has a 'kilo' prefix, see
also http://www.bipm.org/en/si/si_brochure/chapter3/3-2.html

"
Class {
	#name : #Unit,
	#superclass : #Object,
	#classVars : [
		'PrintAbbreviated'
	],
	#category : #'Units-Core'
}

{ #category : #'SI base units' }
Unit class >> A [

	^ self ampere
]

{ #category : #'miscellaneous units' }
Unit class >> C [

	^ self coulomb
]

{ #category : #'miscellaneous units' }
Unit class >> F [

	^ self farad
]

{ #category : #'time units' }
Unit class >> GHz [

	^self gigahertz
]

{ #category : #'time units' }
Unit class >> Hz [

	^self hertz
]

{ #category : #'SI base units' }
Unit class >> K [

	^self kelvin 
]

{ #category : #'time units' }
Unit class >> MHz [

	^self megahertz
]

{ #category : #'mass units' }
Unit class >> Mt [

	^self megatonne
]

{ #category : #'area units' }
Unit class >> a [

	^ self are
]

{ #category : #'miscellaneous units' }
Unit class >> ampere [

	^ BaseUnit ampere
]

{ #category : #'miscellaneous units' }
Unit class >> amperes [

	^ self ampere
]

{ #category : #'mass units' }
Unit class >> angstrom [

	^NamedUnit named: 'angstrom'
]

{ #category : #'mass units' }
Unit class >> angstroms [

	^self angstrom
]

{ #category : #'miscellaneous units' }
Unit class >> arcdegree [

	^ NamedUnit named: 'arcdegree'
]

{ #category : #'miscellaneous units' }
Unit class >> arcdegrees [

	^ self arcdegree
]

{ #category : #'area units' }
Unit class >> are [

	^ NamedUnit named: 'are'
]

{ #category : #'area units' }
Unit class >> ares [

	^ self are
]

{ #category : #'miscellaneous units' }
Unit class >> candela [

	^ BaseUnit candela
]

{ #category : #'SI base units' }
Unit class >> cd [

	^self candela
]

{ #category : #'length units' }
Unit class >> centimeter [

	^ self centimetre
]

{ #category : #'length units' }
Unit class >> centimeters [

	^ self centimetre
]

{ #category : #'length units' }
Unit class >> centimetre [

	^ self metre prefixedBy: 'centi'
]

{ #category : #'length units' }
Unit class >> centimetres [

	^ self centimetre
]

{ #category : #'length units' }
Unit class >> cm [

	^self centimetre
]

{ #category : #'generalized lookup' }
Unit class >> commonUnits [
	"Answer the common units as a collection."

	^{self pixel. self point. self pica. self millimetre.
		self centimetre. self metre. self kilometre.
		self inch. self foot. self yard. self mile}
]

{ #category : #'miscellaneous units' }
Unit class >> coulomb [

	^ NamedUnit named: 'coulomb'
]

{ #category : #'miscellaneous units' }
Unit class >> coulombs [

	^self coulomb
]

{ #category : #'time units' }
Unit class >> day [

	^ NamedUnit named: 'day'
]

{ #category : #'time units' }
Unit class >> days [

	^ self day
]

{ #category : #'miscellaneous units' }
Unit class >> deg [

	^ self arcdegree
]

{ #category : #'temperature units' }
Unit class >> degreeCelsius [

	^ NamedUnit named: 'degree Celsius'
]

{ #category : #'temperature units' }
Unit class >> degreeFahrenheit [

	^ NamedUnit named: 'degree Fahrenheit'
]

{ #category : #'temperature units' }
Unit class >> degreeKelvin [

	^ self kelvin
]

{ #category : #'temperature units' }
Unit class >> degreesCelsius [

	^ self degreeCelsius
]

{ #category : #'temperature units' }
Unit class >> degreesFahrenheit [

	^ self degreeFahrenheit
]

{ #category : #'temperature units' }
Unit class >> degreesKelvin [

	^ self kelvin
]

{ #category : #'miscellaneous units' }
Unit class >> degs [

	^ self arcdegree
]

{ #category : #'time units' }
Unit class >> dy [

	^self days
]

{ #category : #'miscellaneous units' }
Unit class >> farad [

	^NamedUnit named: 'farad'
]

{ #category : #'miscellaneous units' }
Unit class >> farads [

	^ self farad
]

{ #category : #'length units' }
Unit class >> feet [

	^ self foot
]

{ #category : #'length units' }
Unit class >> foot [

	^NamedUnit named: 'foot'
]

{ #category : #'length units' }
Unit class >> ft [

	^self foot
]

{ #category : #'mass units' }
Unit class >> g [

	^ self gram
]

{ #category : #'time units' }
Unit class >> gigahertz [

	^self hertz prefixedBy: 'giga'
]

{ #category : #'power units' }
Unit class >> gigavolt [

	^ self volt prefixedBy: 'giga'
]

{ #category : #'mass units' }
Unit class >> gram [

	^NamedUnit named: 'gram'
]

{ #category : #'mass units' }
Unit class >> grams [

	^ self gram
]

{ #category : #'miscellaneous units' }
Unit class >> gramsPerMole [

	^ Unit gram / Unit mole
]

{ #category : #'time units' }
Unit class >> h [

	^ self hour
]

{ #category : #'area units' }
Unit class >> ha [

	^ self hectare
]

{ #category : #'area units' }
Unit class >> hectare [

	^ self are prefixedBy: 'hecto'
]

{ #category : #'area units' }
Unit class >> hectares [

	^ self hectare
]

{ #category : #'time units' }
Unit class >> hertz [
	^NamedUnit named: 'hertz'
]

{ #category : #'time units' }
Unit class >> hour [

	^ NamedUnit named: 'hour'
]

{ #category : #'time units' }
Unit class >> hours [

	^ self hour
]

{ #category : #'length units' }
Unit class >> in [

	^self inch
]

{ #category : #'length units' }
Unit class >> inch [

	^ NamedUnit named: 'inch'
]

{ #category : #'length units' }
Unit class >> inches [

	^ self inch
]

{ #category : #'class initialization' }
Unit class >> initialize [
	"Unit initialize."
	"This is the master 'initialize' method.  It calls the #initializeClass methods of the
	 classes in this package *in the appropriate order*.  The reason I don't just have the
	 fileout code call #initialize for each class that needs initialization is that this
	 package depends on classes being initialized in a certain order, and the 'topological'
	 fileout order generated by some Smalltalks does not match this order."
	SIPrefix initializeClass.
	BaseUnit initializeClass.
	NamedUnit initializeClass
]

{ #category : #'time units' }
Unit class >> kHz [

	^self kilohertz
]

{ #category : #'temperature units' }
Unit class >> kelvin [

	^ NamedUnit named: 'kelvin'
]

{ #category : #'temperature units' }
Unit class >> kelvins [

	^self kelvin 
]

{ #category : #'SI base units' }
Unit class >> kg [

	^self kilogram
]

{ #category : #'mass units' }
Unit class >> kilogram [

	^ BaseUnit kilogram
]

{ #category : #'mass units' }
Unit class >> kilograms [

	^ self kilogram
]

{ #category : #'time units' }
Unit class >> kilohertz [

	^self hertz prefixedBy: 'kilo'
]

{ #category : #'length units' }
Unit class >> kilometer [

	^ self kilometre
]

{ #category : #'length units' }
Unit class >> kilometers [

	^ self kilometre
]

{ #category : #'length units' }
Unit class >> kilometre [

	^ self metre prefixedBy: 'kilo'
]

{ #category : #'length units' }
Unit class >> kilometres [

	^ self kilometre
]

{ #category : #'power units' }
Unit class >> kilovolt [

	^ self volt prefixedBy: 'kilo'
]

{ #category : #'power units' }
Unit class >> kilowatt [

	^ self watt prefixedBy: 'kilo'
]

{ #category : #'length units' }
Unit class >> km [

	^self kilometre
]

{ #category : #'mass units' }
Unit class >> lb [

	^self pound
]

{ #category : #'miscellaneous units' }
Unit class >> liter [

	^ self litre
]

{ #category : #'miscellaneous units' }
Unit class >> liters [

	^ self litre
]

{ #category : #'miscellaneous units' }
Unit class >> litre [

	^ NamedUnit named: 'litre'
]

{ #category : #'miscellaneous units' }
Unit class >> litres [

	^ self litre
]

{ #category : #'SI base units' }
Unit class >> m [

	^self metre
]

{ #category : #'time units' }
Unit class >> megahertz [

	^self hertz prefixedBy: 'mega'
]

{ #category : #'mass units' }
Unit class >> megatonnes [

	^self tonne prefixedBy: 'mega'
]

{ #category : #'power units' }
Unit class >> megavolt [

	^ self volt prefixedBy: 'mega'
]

{ #category : #'length units' }
Unit class >> meter [

	^ self metre
]

{ #category : #'length units' }
Unit class >> meters [

	^ self metre
]

{ #category : #'length units' }
Unit class >> metre [

	^ BaseUnit metre
]

{ #category : #'length units' }
Unit class >> metres [

	^ self metre
]

{ #category : #'mass units' }
Unit class >> mg [

	^self milligram
]

{ #category : #'length units' }
Unit class >> mi [

	^self mile
]

{ #category : #'mass units' }
Unit class >> microgram [

	^self gram prefixedBy: 'micro'
]

{ #category : #'mass units' }
Unit class >> micrograms [

	^self microgram
]

{ #category : #'length units' }
Unit class >> mile [

	^NamedUnit named: 'mile'
]

{ #category : #'length units' }
Unit class >> miles [

	^ self mile
]

{ #category : #'power units' }
Unit class >> milliamp [

	^ self ampere prefixedBy: 'milli'
]

{ #category : #'mass units' }
Unit class >> milligram [

	^self gram prefixedBy: 'milli'
]

{ #category : #'mass units' }
Unit class >> milligrams [

	^self milligram
]

{ #category : #'length units' }
Unit class >> millimeter [

	^ self millimetre
]

{ #category : #'length units' }
Unit class >> millimeters [

	^ self millimetre
]

{ #category : #'length units' }
Unit class >> millimetre [

	^ self metre prefixedBy: 'milli'
]

{ #category : #'time units' }
Unit class >> milliseconds [

	^self second prefixedBy: 'milli'
]

{ #category : #'power units' }
Unit class >> millivolt [

	^ self volt prefixedBy: 'milli'
]

{ #category : #'time units' }
Unit class >> min [

	^self minutes
]

{ #category : #'time units' }
Unit class >> minute [

	^ NamedUnit named: 'minute'
]

{ #category : #'time units' }
Unit class >> minutes [

	^ self minute
]

{ #category : #'length units' }
Unit class >> mm [

	^self millimetre
]

{ #category : #'SI base units' }
Unit class >> mol [

	^ self moles
]

{ #category : #'mass units' }
Unit class >> mole [

	^ BaseUnit mole
]

{ #category : #'mass units' }
Unit class >> moles [

	^ self mole
]

{ #category : #'time units' }
Unit class >> ms [

	^self milliseconds
]

{ #category : #'generalized lookup' }
Unit class >> named: unitName [
	^self
		withPluralName: unitName
		ifAbsent: [self withSingularName: unitName]
]

{ #category : #'generalized lookup' }
Unit class >> named: unitName ifAbsent: exceptionBlock [
	^self
		withPluralName: unitName
		ifAbsent: [self withSingularName: unitName ifAbsent: exceptionBlock]
]

{ #category : #'power units' }
Unit class >> nanovolt [

	^ self volt prefixedBy: 'nano'
]

{ #category : #'miscellaneous units' }
Unit class >> newton [

	^NamedUnit named: 'newton'
]

{ #category : #'miscellaneous units' }
Unit class >> newtons [
	^NamedUnit named: 'newtons'
]

{ #category : #'mass units' }
Unit class >> ounce [

	^NamedUnit named: 'ounce'
]

{ #category : #'mass units' }
Unit class >> ounces [

	^ self ounce
]

{ #category : #'mass units' }
Unit class >> oz [

	^self ounce
]

{ #category : #'length units' }
Unit class >> pc [

	^ self pica
]

{ #category : #'length units' }
Unit class >> pica [

	^ NamedUnit named: 'pica'
]

{ #category : #'length units' }
Unit class >> picas [

	^ self pica
]

{ #category : #'power units' }
Unit class >> picovolt [

	^ self volt prefixedBy: 'pico'
]

{ #category : #'length units' }
Unit class >> pixel [

	^ NamedUnit named: 'pixel'
]

{ #category : #'length units' }
Unit class >> pixels [

	^ self pixel
]

{ #category : #'length units' }
Unit class >> point [

	^ NamedUnit named: 'point'
]

{ #category : #'length units' }
Unit class >> points [

	^ self point
]

{ #category : #'mass units' }
Unit class >> pound [

	^NamedUnit named: 'pound'
]

{ #category : #'mass units' }
Unit class >> pounds [

	^NamedUnit named: 'pounds'
]

{ #category : #parameters }
Unit class >> printAbbreviated [
	^PrintAbbreviated
]

{ #category : #parameters }
Unit class >> printAbbreviated: boolean [
	"Should we print units in abbreviated format?"
	PrintAbbreviated := boolean
]

{ #category : #'length units' }
Unit class >> pt [

	^ self point
]

{ #category : #'length units' }
Unit class >> px [

	^ self pixel
]

{ #category : #'miscellaneous units' }
Unit class >> rad [

	^ self radian
]

{ #category : #'miscellaneous units' }
Unit class >> radian [

	^ BaseUnit named: 'radian'
]

{ #category : #'miscellaneous units' }
Unit class >> radians [

	^ self rad
]

{ #category : #'SI base units' }
Unit class >> s [

	^ self second
]

{ #category : #'time units' }
Unit class >> second [

	^ BaseUnit second
]

{ #category : #'time units' }
Unit class >> seconds [

	^ self second
]

{ #category : #'mass units' }
Unit class >> st [

	^self stone
]

{ #category : #'mass units' }
Unit class >> stone [

	^NamedUnit named: 'stone'
]

{ #category : #'mass units' }
Unit class >> t [

	^self tonne
]

{ #category : #'mass units' }
Unit class >> tonne [

	^NamedUnit named: 'tonne'
]

{ #category : #'mass units' }
Unit class >> tonnes [

	^ self tonne
]

{ #category : #'length units' }
Unit class >> ua [
	^NamedUnit named: 'astronomical unit'
]

{ #category : #'power units' }
Unit class >> volt [

	^ BaseUnit volt
]

{ #category : #'power units' }
Unit class >> volts [

	^ BaseUnit volts
]

{ #category : #'power units' }
Unit class >> watt [

	^ NamedUnit named: 'watt'
]

{ #category : #'power units' }
Unit class >> watts [

	^ NamedUnit named: 'watts'
]

{ #category : #'generalized lookup' }
Unit class >> withAbbreviation: abbreviation [
	^self
		withAbbreviation: abbreviation
		ifAbsent: [self error: 'There is no unit with the abbreviation ', abbreviation printString, '.']
]

{ #category : #'generalized lookup' }
Unit class >> withAbbreviation: unitName ifAbsent: exceptionBlock [
	| unit |
	unit := NamedUnit withAbbreviation: unitName ifAbsent: [nil].
	unit isNil ifFalse: [^unit].
	unit := BaseUnit withAbbreviation: unitName ifAbsent: exceptionBlock.
	^unit
]

{ #category : #'generalized lookup' }
Unit class >> withPluralName: unitName [
	^self
		withPluralName: unitName
		ifAbsent: [self error: 'There is no unit named ', unitName printString, '.']
]

{ #category : #'generalized lookup' }
Unit class >> withPluralName: unitName ifAbsent: exceptionBlock [
	| unit |
	unit := NamedUnit withPluralName: unitName ifAbsent: [nil].
	unit isNil ifFalse: [^unit].
	unit := BaseUnit withPluralName: unitName ifAbsent: exceptionBlock.
	^unit
]

{ #category : #'generalized lookup' }
Unit class >> withSingularName: unitName [
	^self
		withSingularName: unitName
		ifAbsent: [self error: 'There is no unit named ', unitName printString, '.']
]

{ #category : #'generalized lookup' }
Unit class >> withSingularName: unitName ifAbsent: exceptionBlock [
	| unit |
	unit := NamedUnit withSingularName: unitName ifAbsent: [nil].
	unit isNil ifFalse: [^unit].
	unit := BaseUnit withSingularName: unitName ifAbsent: exceptionBlock.
	^unit
]

{ #category : #'length units' }
Unit class >> yard [

	^ NamedUnit named: 'yard'
]

{ #category : #'length units' }
Unit class >> yards [

	^ self yard
]

{ #category : #'length units' }
Unit class >> yd [

	^ self yard
]

{ #category : #'time units' }
Unit class >> year [

	^ NamedUnit named: 'year'
]

{ #category : #'time units' }
Unit class >> years [

	^ self year
]

{ #category : #'time units' }
Unit class >> yr [

	^self year
]

{ #category : #'mass units' }
Unit class >> µg [

	^self microgram
]

{ #category : #'unit arithmetic' }
Unit >> * anotherUnit [
	^self multipliedBy: anotherUnit
]

{ #category : #'unit arithmetic' }
Unit >> / anotherUnit [
	^self dividedBy: anotherUnit
]

{ #category : #accessing }
Unit >> abbreviation [
	"Answer an abbreviation for the receiver."
	| stream |
	stream := WriteStream on: String new.
	self printAbbreviationOn: stream.
	^stream contents
]

{ #category : #conversion }
Unit >> additiveFactor [
	"Only TemperatureUnits have additive factors."
	^0
]

{ #category : #conversion }
Unit >> baseUnits [
	"Answer a Unit object that represents the receiver in reduced form (i.e., with all 'complex' units replaced by SI units)."
	self subclassResponsibility
]

{ #category : #consistency }
Unit >> consistentWith: unit [
	"Is the receiver 'consistent' with the argument?  Two units must be consistent in order to be added or subtracted."
	self subclassResponsibility
]

{ #category : #consistency }
Unit >> consistentWithAnything: anotherUnit [
	^false
]

{ #category : #consistency }
Unit >> consistentWithBaseUnit: baseUnit [
	^self consistentWithAnything: baseUnit
]

{ #category : #consistency }
Unit >> consistentWithComplexUnit: compositeUnit [
	^self consistentWithAnything: compositeUnit
]

{ #category : #consistency }
Unit >> consistentWithCompoundUnit: compositeUnit [
	^self consistentWithAnything: compositeUnit
]

{ #category : #consistency }
Unit >> consistentWithModifiedUnit: modifiedUnit [
	^self consistentWithAnything: modifiedUnit
]

{ #category : #conversion }
Unit >> conversionFactor [
	"Answer the factor by which the receiver is larger than the base units from which it is composed."
	^self subclassResponsibility
]

{ #category : #conversion }
Unit >> conversionFactorTo: anotherUnit [
	"Assuming the receiver is consistent with 'anotherUnit', answer a number which represents the amount that a value with the receiver as a unit must be multiplied by to convert to 'anotherUnit' (got it?)"
	^self conversionFactor / anotherUnit conversionFactor
]

{ #category : #'unit arithmetic' }
Unit >> dividedBy: anotherUnit [
	^self multipliedBy: anotherUnit reciprocal
]

{ #category : #conversion }
Unit >> factor: anotherUnit [
	"Factor with respect 'anotherUnit'; answer a new unit equivalent to the receiver."
	| thisBase argumentBase result |
	thisBase := self baseUnits.
	argumentBase := anotherUnit baseUnits.
	result := thisBase dividedBy: argumentBase.
	^anotherUnit multipliedBy: result
]

{ #category : #predicates }
Unit >> isBaseUnit [
	"Answer true if the receiver represents a simple SI base unit with no modifications."
	^false
]

{ #category : #testing }
Unit >> isComplexUnit [
	^ false
]

{ #category : #predicates }
Unit >> isNull [
	^false
]

{ #category : #predicates }
Unit >> isZeroAsValue: value [
	"If 'value' were the value of a UnitValue with this unit,
would it equal zero?  Most units are absolute (e.g., length) so this
answers true for zero values.  Some units are not; for example
the Celsius and Fahrenheit temperature scales."
	^value isZero
]

{ #category : #conversion }
Unit >> modify: modification [
	"Answer a ModifiedUnit with the receiver and the given modification."
	self isBaseUnit ifFalse: [self error: 'You can only modify base units.'].
	^ModifiedUnit baseUnit: self modification: modification
]

{ #category : #'unit arithmetic' }
Unit >> multipliedBy: anotherUnit [
	| unitDictionary units exponents scratch |
	unitDictionary := Dictionary new.
	self unitsAndExponentsDo: [:unit :exponent |
		(unitDictionary includesKey: unit)
			ifTrue: [unitDictionary at: unit put: (unitDictionary at: unit) + exponent]
			ifFalse: [unitDictionary at: unit put: exponent]].
	anotherUnit unitsAndExponentsDo: [:unit :exponent |
		(unitDictionary includesKey: unit)
			ifTrue: [unitDictionary at: unit put: (unitDictionary at: unit) + exponent]
			ifFalse: [unitDictionary at: unit put: exponent]].
	units := OrderedCollection new.
	exponents := OrderedCollection new.
	(unitDictionary keys asSortedCollection: CompoundUnit sortBlock) do: [:unit |
		scratch := unitDictionary at: unit.
		scratch isZero ifFalse: [
			units add: unit.
			exponents add: scratch]].
	units size = 1 ifTrue: [
		(exponents at: 1) = 1 ifTrue: [^units at: 1]].
	^ComplexUnit units: units exponents: exponents
]

{ #category : #'unit arithmetic' }
Unit >> per: anotherUnit [
	^self dividedBy: anotherUnit
]

{ #category : #accessing }
Unit >> plural [
	"Answer the plural for the receiver."
	
	| stream |
	stream := WriteStream on: String new.
	self printFullNameOn: stream pluralized: true.
	^stream contents
]

{ #category : #conversion }
Unit >> prefixedBy: prefixName [
	^PrefixedUnit
		prefixName: prefixName
		unit: self
]

{ #category : #printing }
Unit >> printAbbreviationOn: stream [
	"Print the receiver abbreviated."
	self subclassResponsibility
]

{ #category : #printing }
Unit >> printFullNameOn: stream pluralized: pluralized [
	"Print the full name of this unit, pluralized if 'pluralized' is true."
	self subclassResponsibility
]

{ #category : #printing }
Unit >> printOn: stream [
	super printOn: stream.
	stream nextPutAll: ' ['.
	PrintAbbreviated
		ifTrue: [self printAbbreviationOn: stream]
		ifFalse: [self printFullNameOn: stream pluralized: true].
	stream nextPut: $]
]

{ #category : #'unit arithmetic' }
Unit >> raisedTo: exponent [
	"Answer the receiver raised to the given exponent."
	^ComplexUnit
		units: (Array with: self)
		exponents: (Array with: exponent)
]

{ #category : #'unit arithmetic' }
Unit >> reciprocal [
	"Answer the inverse of the receiver."
	^ComplexUnit
		units: (Array with: self)
		exponents: (Array with: -1)
]

{ #category : #'unit arithmetic' }
Unit >> squared [
	^self multipliedBy: self
]

{ #category : #conversion }
Unit >> uncheckedConvertFrom: unitValue [
	"This is a double-dispatching message used by UnitValue."
	| factor |
	factor := unitValue unit conversionFactorTo: self.
	^UnitValue
		unit: self
		value: unitValue value * factor
]

{ #category : #private }
Unit >> unitPart [
	"For compatibility with UnitValue."
	^self
]

{ #category : #enumerating }
Unit >> unitsAndExponentsDo: block [
	"Evaluate the block once for each unit/exponent pair contained within the receiver.
	 For scalar units, just evaluate the block once with 'self', exponent 1."
	block value: self value: 1
]

{ #category : #conversion }
Unit >> value: number [
	"Coerce the receiver to be a UnitValue with the given value."
	^UnitValue
		unit: self
		value: number
]

{ #category : #conversion }
Unit >> veryDeepCopyWith: deepCopier [
	"Return self.  Don't copy units  Do not record me."
]
