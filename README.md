# nrandom

Return random a probability index

```
Ex: length = 5
1 2 3 4 5 => default probability = 100 / length = 20% each number
If choose 1
=> probability of number 1 will DECREASE A HALF (changeable) -> from 20% to 10%
=> 10% from number 1 will increase all the remaining 4 numbers
1    2      3      4      5
10%  22.5%  22.5%  22.5%  22.5%
Continue, next random is number 3
1       2       3       4       5
13.75%  26.25%  11.25%  26.25%  26.25%
```

## Usage
```
// Arrange
final int length = 5;
final NRandom nrandom = NRandom(length);

// Act
final int index = nrandom.getNextIndex();
```