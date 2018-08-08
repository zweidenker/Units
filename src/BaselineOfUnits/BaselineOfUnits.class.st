Class {
	#name : #BaselineOfUnits,
	#superclass : #BaselineOf,
	#category : #BaselineOfUnits
}

{ #category : #baselines }
BaselineOfUnits >> baseline: spec [
	<baseline>

	spec for: #'common' do: [		
		spec 
			package: 'Units-Core';
			package: 'Units-Tests' with: [ spec requires: 'Units-Core' ].
			
		spec 
			group: 'default' with: #('core' 'test');
			group: 'core'     with: #('Units-Core');
			group: 'test'      with: #('Units-Tests')].
		
		
	 
]
