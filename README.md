# Units

A simple package for Units management in Pharo.

## Installation

To install Units on your Pharo image you can just execute the following script: 

```Smalltalk
    Metacello new
    	githubUser: 'zweidenker' project: 'Units' commitish: 'master' path: 'src';
    	baseline: 'Units';
    	load
```

To add Units to your baseline just add this:

```Smalltalk
    spec
    	baseline: 'Units'
    	with: [ spec repository: 'github://zweidenker/Units:master/src' ]
```

Note that you can replace the #master by another branch or a tag.