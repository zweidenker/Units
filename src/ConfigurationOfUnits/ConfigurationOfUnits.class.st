"
(ConfigurationOfUnits project version: #stable) load
"
Class {
	#name : #ConfigurationOfUnits,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfUnits
}

{ #category : #'development support' }
ConfigurationOfUnits class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfUnits class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #catalog }
ConfigurationOfUnits class >> catalogChangeLog [

^ '
- 2013-12-28 Version 1.1 - split core from tests.

[ [ [ 
	(ConfigurationOfUnit project version: ''1.1'') load.
] ] ]

- 2013-08-31 Version 1.0 - first configuration.

[ [ [ 
	(ConfigurationOfUnit project version: ''1.0'') load.
] ] ]
'
]

{ #category : #catalog }
ConfigurationOfUnits class >> catalogDescription [
	^ 'Units is a simple and powerful library to manage different units.'
]

{ #category : #catalog }
ConfigurationOfUnits class >> catalogKeyClassesAndExample [

^ 'The key classes are

- ==Unit==
Class Unit is the superclass for all other unit classes.
Instances represent units which are attached to numbers; for example
meters (a BaseUnit), meters per second (a CompoundUnit),
joule seconds per liter (a ComplexUnit),  degrees Kelvin (a TemperatureBaseUnit),
degrees Celsius (a TemperutareUnit),  kilohertz (a PrefixedUnit),
and moles of hydrogen (a ModifiedUnit).

==UnitValue== which represents a number with a unit.
'
]

{ #category : #catalog }
ConfigurationOfUnits class >> catalogKeywords [
	^ #(Units Comparison Meter Points)
]

{ #category : #private }
ConfigurationOfUnits class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfUnits class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfUnits class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #'metacello tool support' }
ConfigurationOfUnits class >> lastMetacelloVersionLoad [
	"Answer the last version loaded and the list of packages loaded for that version."

	LastVersionLoad == nil ifTrue: [ LastVersionLoad := nil -> 'default' ].
	^LastVersionLoad
]

{ #category : #loading }
ConfigurationOfUnits class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfUnits class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfUnits class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #'metacello tool support' }
ConfigurationOfUnits class >> metacelloVersion: versionString loads: anArrayOrString [
	"Stash the last version loaded and the list of packages loaded for that version. The list
	 of packages will be used by the tools when doing 'Load Package Version'"

	LastVersionLoad := versionString -> anArrayOrString
]

{ #category : #accessing }
ConfigurationOfUnits class >> project [

	^self new project
]

{ #category : #'unloading Metacello' }
ConfigurationOfUnits class >> unloadMetacello [

	Smalltalk at: #ConfigurationOfMetacello ifPresent: [:cls | cls unloadMetacello ]
]

{ #category : #'development support' }
ConfigurationOfUnits class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfUnits >> baseline10: spec [
	<version: '1.0-baseline'>

	spec for: #'pharo' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/MarcusDenker/Units/main'.
		spec package: 'Units'].
		
		
	 
]

{ #category : #baselines }
ConfigurationOfUnits >> baseline11: spec [
	<version: '1.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/MarcusDenker/Units/main'.
		
		spec 
			package: 'Units-Core';
			package: 'Units-Tests' with: [ spec requires: 'Units-Core' ].
			
		spec 
			group: 'default' with: #('core' 'test');
			group: 'core'     with: #('Units-Core');
			group: 'test'      with: #('Units-Tests')].
		
		
	 
]

{ #category : #accessing }
ConfigurationOfUnits >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfUnits >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '1.1-baseline'.

]

{ #category : #accessing }
ConfigurationOfUnits >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfUnits >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.2'.

]

{ #category : #versions }
ConfigurationOfUnits >> version10: spec [
	<version: '1.0' imports: #('1.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: 'First release'.
		spec author: 'tbn'.
		spec timestamp: '6/14/2013 08:58'.
		spec package: 'Units' with: 'Units-espin.36'. 
	].


]

{ #category : #versions }
ConfigurationOfUnits >> version11: spec [
	<version: '1.1' imports: #('1.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: 'Cleanup and split core from tests'.
		spec author: 'tbn'.
		spec timestamp: '12/28/2013 08:58'.
		spec package: 'Units-Core' with: 'Units-Core-TorstenBergmann.2'.
		spec package: 'Units-Tests' with: 'Units-Tests-TorstenBergmann.1'
	].


]

{ #category : #versions }
ConfigurationOfUnits >> version12: spec [
	<version: '1.2' imports: #('1.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'Current development'.
		spec author: 'tbn'.
		spec timestamp: '12/28/2013 08:58'.
		spec package: 'Units-Core' with: 'Units-Core-GuillaumeLarcheveque.5'.
		spec package: 'Units-Tests' with: 'Units-Tests-GuillaumeLarcheveque.2'
	].


]
