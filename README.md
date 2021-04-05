# Extended Pairs

This is a small roblox lua module that adds some iterators (or more like generators).

Atm this module has 4 iterators.

## msipairs

A parallel stateless iterator, which stops at first nil. 
It returns the index and the value for each given array at that index.

```lua
local arr1 = {10, 9, 8}
local arr2 = {1, 2, 3, 4}

for i, v1, v2 in l.msipairs(arr1, arr2) do -- multi shortest ipairs
    print(i , v1, v2)
end

[[ RESULT
1    10   1
2    9    2
3    8    3
]]
```

## mlipairs

A parallel stateless iterator, which stops when *every value* is nil. 
It returns the index and the value for each given array at that index.

```lua
local arr1 = {10, 9, 8}
local arr2 = {1, 2, 3, 4}

for i, v1, v2 in l.mlipairs(arr1, arr2) do -- multi longest ipairs
    print(i , v1, v2)
end

[[ RESULT
1    10   1
2    9    2
3    8    3
4    nil  4       
]]
```

## cpairs

A sequentially stateless iterator.
It returns the index and the value.

```lua
local arr1 = {10, 9, 8}
local arr2 = {1, 2, 3, 4}
local dict = {b = 5, c = 6, d = 7}

for i, v in l.cpairs(arr1, arr, dict) do -- chained pairs
    print(i , v)
end

[[ RESULT
1    10 
2    9  
3    8  
1    1
2    2
3    3
4    4
b    5
c    6
d    7       
]] 
```

## Download 
- [from the release page](https://github.com/VerdommeMan/Extended-Pairs/releases)
- [link to roblox asset page]()
- or you can build it from [src](/src) using rojo

## Code examples

```lua
local ServerStorage = game:GetService('ServerStorage')

local l = require(ServerStorage:WaitForChild("epairs"))

local arr1 = {1,2,3}
local arr2 = {1,2,3,4}

for i, v1, v2 in l.mlipairs(arr1, arr2) do -- multi longest ipairs
    print(i , v1, v2)
end

print(('-'):rep(10))

for i, v1, v2 in l.msipairs(arr1, arr2) do -- multi shortest ipairs
    print(i , v1, v2)
end

print(('-'):rep(10))

local someModel
local someOtherModel

for _, part in l.cpairs(someModel:GetChildren(), someOtherModel:GetChildren()) do
  part.Transparency = 0
end
```


## API
The API is in the form of `returnType` **function**(argumentName:`type`)

### Functions

#### `function` **msipairs**(...:`table`)
##### It returns an iterator function

#### `function` **mlipairs**(...:`table`)
##### It returns an iterator function

#### `function` **cpairs**(...:`table`)
##### It returns an iterator function

#### `function` **bipairs**(...:`table`)
##### It returns an iterator function, this function is used to iterate backwards over an array (from higest index to lowest)
