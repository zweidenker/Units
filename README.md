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

## Examples

### Create units

```Smalltalk

15 units: #gram. "15 grams"

15 units: #newton. "15 newtons"

15g. "15 grams"

(15 units: #mile) / (1 units: #second). "15 miles per second"

15mi/1 s. "15 miles per second"

3m * 3m. "9 square metres"

```

### Compare units

```Smalltalk

1cm > 2cm. "false"

1cm >= 1cm. "true"

15 cm = 150 mm. "true"

15cm > 1500mm. "false"

```

### Operations on units

```Smalltalk

1g + 1g. "2 grams"

1kg + 1g. "(1001/1000) kilograms"

1g + 1kg. "1001 grams"

14foot + 15m. "63.212598425196845 feet"

10g - 1g. "9 grams"

9 * 1g. "9 grams"

9g * 3. "27 grams"

100g / 2. "50 grams"

```

### Convertions 

```Smalltalk

15mi/1h convertTo: (Unit m / Unit s). "6.7056 metres per second"

3kg factor: Unit g. "3000 grams"

(3 units: #newton) factor: Unit g. "3000 gram metres per square second"

```

 