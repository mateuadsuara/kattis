## Kattis

project structure for working on the https://open.kattis.com/ problems

## How to use this structure

Let's take the example of the initial problem used in the help section: https://open.kattis.com/help/haskell (A Different Problem: https://open.kattis.com/problems/different)

### folders overview

The `src` folder should contain a module for the solution to the problem (eg: `src/ADifferentProblem.hs`).

The `src-exe` folder should contain only the `Main.hs` executable. This file should import the module for the problem and execute its code with the main function.

The `test` folder should contain any automated tests needed (eg: `test/ADifferentProblemSpec.hs`)

### run the automated tests

You can use the `./run-test` script included (it will use Stack or Cabal)
This will run all the automated tests inside the `test` folder.

### execute the code

First, you need to update the `src-exe/Main.hs` file so it imports the module for the problem you want to run and use it with the main function.

Then, you can use the `./run-exe` script included (it will use Stack or Cabal).

If you wish to send an input automatically, you can use the `echo` command like this:
`echo -e "1 2\n3 5\n" | ./run-exe`.

That should output the following and terminate:
```
1
2
```

And if you have samples for the input, you can also use them like this:
`cat test/ADifferentProblemSamples/sample.in | ./run-exe`.

That should output:
```
2
71293781685339
12345677654320
```

Which should be the same as the sample answer:
`cat test/ADifferentProblemSamples/sample.ans`
```
2
71293781685339
12345677654320
```

### submit to kattis

When you click the Submit button on the problem page (https://open.kattis.com/problems/different), it will take you to another page where you can submit the solution files (https://open.kattis.com/problems/different/submit).

In the page for submitting the solution files, select the main executable file (`src-exe/Main.hs`) and the problem module (`src/ADifferentProblem.hs`).
Uploading both will work as expected.
