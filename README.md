Project # 2 - Night-Writer

The idea of Night Writing was first developed for Napoleon's army so soldiers could communicate silently at night without light. The concept of night writing led to Louis Braille's development of his Braille tactile writing system.

In this project the goal is to implement systems for generating Braille-like text from normal characters and the reverse.

Simulating Braille

Braille uses a two-by-three grid of dots to represent characters. The goal is to simulate that concept by using three lines of symbols:

"hello world"

0.0.0.0.0....00.0.0.00
00.00.0..0..00.0000..0
....0.0.0....00.0.0...

The braille files must be constrained to 80 braille characters (160 dots) wide.

Goals / Areas of Focus in this project:

Practice breaking a program into logical components
Testing components in isolation and in combination
Applying Enumerable techniques in a real context
Reading text from and writing text to files
Base Expectations

An Interaction Model

The tool is used from the command line like so:

$ ruby ./lib/night_write.rb message.txt braille.txt
Created 'braille.txt' containing 256 characters
That will use the plaintext file message.txt to create a Braille simulation file braille.txt.

Then we can convert that Braille simulation back to normal text:

$ ruby ./lib/night_read.rb braille.txt original_message.txt
Created 'original_message.txt' containing 256 characters.
Character Support

The goal is to also support capitalization. In Braille, capitalization comes from a shift character.

Development Phases

1. The Runner

Write a Ruby program that can just output a string like:

$ ruby ./lib/night_write.rb message.txt braille.txt
Created 'braille.txt' containing 256 characters
Then work to:

2. Echo Characters

Your Braille-simulation file will need three lines of output for every one line of input. Start by outputting your input in three repeated rows.

hello world
Turns into

hello world
hello world
hello world

3. Mapping

You'll need a component that takes a normal text character and returns the Braille equivalent. It's time to build that now.

4. Triple Replacement

Bringing together the Echo Characters idea with the Mapping idea, you can actually output your Braille characters to the file. Consider building a component that would take in a plain-text letter and a position (maybe numbered 0-5) and would return either a 0 or ..

5. Next Steps

About this point, you should try Braille-ifying a message and exchange it with a classmate. Are your outputs identical?

Then it's time to dive into the reading.

Extensions

1. Supporting Numbers

Return to the graphic referenced above and you'll find a the # in the bottom left corner. Notice that the representations for 1-9 are actually the same as a-i. This number sign is a "switch" which means that all of the following "letters", up to the next space, are actually numbers. After the space it's assumed that we're back to words/letters unless we see another number switch.

Add support for numbers to your program.

2. Supporting Contractions

There are contractions commonly understood in Braille. They're a single letter symbol (so it has spaces on each side) which stands in for a common word.

Find the symbols here on Wikipedia and add support in your program for the following:

a, but, can, do, every, from, go, have, just, knowledge, like, more, not, people, quite, rather, so, that, us, very, it, you, as, child, shall, this, which, out, will, enough, were, in
These should be used both when going from standard characters to Braille (ie, from is output as one character of Braille) and in your expansion from Braille to standard characters.

The project will be assessed with the following rubric:

1. Overall Functionality

4: Application follows the complete spec and two extensions
3: Application follows the complete spec and one extension
2: Application converts to Braille and back successfully
1: Application only converts to Braille or from Braille
2. Fundamental Ruby & Style

4: Application demonstrates excellent knowledge of Ruby syntax, style, and refactoring
3: Application shows some effort toward organization but still has 6 or fewer long methods (> 8 lines) and needs some refactoring.
2: Application runs but the code has many long methods (>8 lines) and needs significant refactoring
1: Application generates syntax error or crashes during execution
3. Test-Driven Development

4: Application is broken into components which are well tested in both isolation and integration
3: Application uses tests to exercise core functionality but leaves many common edge cases untested.
2: Minor mutations to the implementation code, such as swaping characters, changing < to <=, placing true into a conditional, or deleting a line of code which break the functionality do not cause any tests to fail.
1: Application does not demonstrate strong use of TDD

4. Breaking Logic into Components

4: Application effectively breaks logical components apart with clear intent and usage
3: Application has multiple components with defined responsibilities but there is some leaking of responsibilities
2: Application has some logical components but divisions of responsibility are inconsistent or unclear and/or there is a "God" object taking too much responsibility
1: Application logic shows poor decomposition with too much logic mashed together
