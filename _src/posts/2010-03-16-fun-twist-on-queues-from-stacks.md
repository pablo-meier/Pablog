    Title: A fun twist on Queues from Stacks
    Date:2010-03-16T20:52:00
    Tags: pablolife

There's too, too much to write about, but I'm going to make a little diversion 
known, because it blew my mind.  I have to give credit where it's due: this
comes to us from the peerless Matt Wilde ([cs dept.][1],[facebook][2]).

The problem is this: our friend Josh was given some screening questions to
qualify for a programming interview (to make sure he wasn't one of those
[programmers who couldn't program][3]), and one of the questions was "Recall
that the Stack ADT contains push(E), pop(), ... Implement a Queue using a
Stack."

Now, this interview question is very common, if you disallow what was almost
certainly an error in the problem phrasing; usually it's "Implement a Queue
given Stacks" or "If you had a library that produced Stacks, how would you
implement a Queue?" (answer at the end, for those who don't know and/or don't
want to figure it out.)

But the problem was unclear: using _a_ Stack? Only a single instance? Is it
even possible? The common solution to the common problem uses two stacks. Mr.
Wilde came up with the following solution, which does in fact use only one
instance of a stack: _use the program's call stack, along with recursion, to
keep track of intermediate values._ Shown algorithmically (in Ruby, since it
looks the most like pseudocode):

{% codeblock lang:ruby %}
    def enqueue(element)
        @stack.push element
    end
   
    def dequeue
        if @stack.size == 1
            return @stack.pop
        elsif @stack.size > 1
            tmp = @stack.pop
            value = self.dequeue
            @stack.push tmp
            return value
        else
            raise EmptyStackException
        end
    end
{% endcodeblock %}


_Amazing!_ Here's the standard solution with two stacks:

{% codeblock lang:ruby %}
    def enqueue(element)
        @first.push element
    end
   
    def dequeue
        if not @second.empty
            return @second.pop
        elsif @first.empty
            raise EmptyStackException
        else
            while not @first.empty
                @second.push @first.pop
            end
            return @second.pop
        end
    end
{% endcodeblock %}

The intuition in this case is that you use one stack for enqueueing and
another for dequeueing. When the dequeue stack becomes empty, you remove all
elements from the enqueue stack into the dequeue stack. This puts the enqueued
elements in the dequeue stack in reverse order, meaning you can pop them in
the order they were inserted in.

This gives you constant-time performance on most enqueues and dequeues, with
an occasional _O(n)_ for when the dequeue stack runs out.


   [1]: http://www.cs.brown.edu/people/mwilde/
   [2]: http://www.facebook.com/#!/mcwilde?ref=ts
   [3]: http://www.codinghorror.com/blog/2007/02/why-cant-programmers-program.html
