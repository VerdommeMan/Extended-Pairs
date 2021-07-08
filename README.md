# Extended Pairs

This is a small roblox lua module that adds some iterators (or more like generators).

Atm this module has 5 iterators.

## TOC
- [TOC](#toc)
- [Download](#download)
- [msipairs](#msipairs)
- [mlipairs](#mlipairs)
- [cpairs](#cpairs)
- [vpairs](#vpairs)
- [Code examples](#code-examples)
- [API](#api)
  - [Functions](#functions)
    - [`function` **msipairs**(...:`table`)](#function-msipairstable)
    - [`function` **mlipairs**(...:`table`)](#function-mlipairstable)
    - [`function` **cpairs**(...:`table`)](#function-cpairstable)
    - [`function` **vpairs**(...:`varadic`)](#function-vpairsvaradic)
    - [`function` **bipairs**(t:`table`)](#function-bipairsttable)

## Download 
- [from the release page](https://github.com/VerdommeMan/Extended-Pairs/releases)
- [link to roblox asset page](https://www.roblox.com/library/6640534357/Extended-Pairs)
- or you can build it from [src](/src) using rojo

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

A parallel stateless iterator, which stops when **every value** is nil. 
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

## vpairs

A stateless iterator, very similar to ipairs but is given directly the varadic and will loop until select('#', ...) instead of until first nil
It returns the index and the value.

```lua

function test(...)
    for i, v in l.vpairs(...) do
        print(i, v)
    end
end

test("hello", nil, nil ,nil, 5, nil, {}, nil)

[[ RESULT
1    "hello" 
2    nil
3    nil  
4    nil
5    5
6    nil
7    {}
8    nil
]]
```

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

function test(...)
    for i, v in l.vpairs(...) do
        print(i, v)
    end
end

test("hello", nil, nil ,nil, 5, nil, {}, nil)

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

#### `function` **vpairs**(...:`varadic`)
##### It returns an iterator function, you pass the variadic direclty and it will loop until it full length, nil safe e.g. loops until select('#', ...) instead of until first nil

#### `function` **bipairs**(t:`table`)
##### It returns an iterator function, this function is used to iterate backwards over an array (from higest index to lowest)
