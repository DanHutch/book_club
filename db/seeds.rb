# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

book_1 = Book.create(title: "The Shadow Of The Wind", pages: 565, year: 2001)
author_1 = book_1.authors.create(name: "Carlos Ruiz Zafon")
user_1 = User.create(name: "Nathan Drake")
review_1 = user_1.reviews.create(title: "Great Book", description: "A master piece of the 20th century", score: 4, book: book_1)


book_2 = Book.create(title: "Blindness", pages: 288, year: 1997)
author_2 = book_2.authors.create(name: "Jose Saramago")
user_2 = User.create(name: "Pepper Pots")
review_2 = user_2.reviews.create(title: "Crazy become real", description: "Great recreation of what a epidemic of blindness can do to the population of a small region. Great ending", score: 5, book: book_2)

user_3 = User.create(name: "Wade Wilson")
review_3 = user_3.reviews.create(title: "Borring!!!", description: "this is the most boring book I had ever read in my whole life... and yes a spelled boring with a doble 'r'", score: 1, book: book_1)

book_3 = Book.create(title: "Brida", pages: 189, year: 1990)
author_3 = book_3.authors.create(name: "Paulo Coelho")
user_4 = User.create(name: "Bruce Banner")
review_4 = user_4.reviews.create(title: "HULK SAD", description: "BANNER WAS LOOKING A THIS BOOK. THEM I APPEAR.", score: 1, book: book_3)

user_5 = User.create(name: "Son Goku")
review_5 = user_5.reviews.create(title: "Is okay", description: "Interesting to read for a heavy and convoluted story", score: 3, book: book_2)

book_4 = Book.create(title: "One Houndred Years of Solitude", pages: 457, year: 1970)
author_4 = book_4.authors.create(name: "Gabriel Garcia Marquez")
user_7 = User.create(name: "Mariza Taton")
review_7 = user_7.reviews.create(title: "Awesome", description: "A master piece, great story, a good way to portrate living in a small town in the middle of the caribbean with a little twist", score: 4, book: book_4)

book_5 = author_1.books.create(title: "Angel's Game", pages: 672, year: 2008)
user_6 = User.create(name: "Melvin Marcano")
review_6 = user_6.reviews.create(title: "Good", description: "Is satiric way to view religion", score: 4, book: book_5)

review_8 = user_3.reviews.create(title: "Another piece of poop", description: "What I'm the guy who likes to give bad review", score: 1, book: book_2)

book_6 = author_2.books.create(title: "Death With Interruptions", pages: 256, year: 2008)
review_9 = user_2.reviews.create(title: "Good", description: "Romance in a unusual situation", score: 4, book: book_6)

book_7 = Book.create(title: "Orxy and Crake", pages: 717, year: 2003)
author_5 = book_7.authors.create(name: "Paulo Coelho")
user_7 = User.create(name: "Carlos Diaz")
review_10 = user_7.reviews.create(title: "Extreme", description: "A wierd postapocalyptic view of the world", score: 5, book: book_7)

review_11 = user_3.reviews.create(title: "It's a Bad one", description: "you know how I am", score: 1, book: book_7)

book_8 = Book.create(title: "Game Of Thrones", pages: 604, year: 1996)
author_6 = book_8.authors.create(name: "George R. R. Martin")
user_8 = User.create(name: "Melanie Carton")
review_12 = user_8.reviews.create(title: "Excelent", description: "a really good epic fantasy book, everyone dies", score: 5, book: book_8)

review_13 = user_3.reviews.create(title: "Ehh This One Is Good", description: "what can i see is game of thornes", score: 4, book: book_8)

review_14 = user_5.reviews.create(title: "Good book", description: "an epic story", score: 3, book: book_8)

book_9 = author_6.books.create(title: "A Clash of Kings", pages: 768, year: 1998)
user_9 = User.create(name: "Facundo Gracia")
review_15  = user_9.reviews.create(title: "So bad", description: "To much death in this book", score: 2, book: book_9)

book_10 = author_6.books.create(title: "A Storm OF Swords", pages: 973, year: 2000)
user_10 = User.create(name: "Neyla Gracia")
review_16  = user_10.reviews.create(title: "Very good", description: "Great expantion of the plot", score: 4, book: book_10)

review_17 = user_3.reviews.create(title: "My type of book", description: "Hey Facundo read the chapter 43 The red wedding you are goin ot love it", score: 5, book: book_10)

review_18 = user_9.reviews.create(title: "Bad Bad Bad", description: "this is so bad. So much death. It hurts", score: 1, book: book_10)

review_19 = user_5.reviews.create(title: "Strong Content", description: "Good book, lot's of plots lines. It's okay", score: 5, book: book_10)

review_20 = user_7.reviews.create(title: "Good Series", description: "Just finish it totally recomended", score: 5, book: book_8)

review_21 = user_7.reviews.create(title: "Good Series", description: "Just finish it totally recomended", score: 5, book: book_9)

review_22 = user_7.reviews.create(title: "Good Series", description: "Just finish it totally recomended", score: 5, book: book_10)

book_11 = author_6.books.create(title: "A Feast of Crows", pages: 752, year: 2005)
user_11 = User.create(name: "Silvester Enigma")
review_23 = user_11.reviews.create(title: "???", description: "I read the book and I didn't understanded. Them I realize I need to read the first 3 books", score: 2, book: book_11)

book_12 = author_6.books.create(title: "A Dance Wiht  Drangons", pages: 1056, year: 2011)
user_12 = User.create(name: "Chad Sutoosky")
review_24 = user_11.reviews.create(title: "Just Finish the 5th book", description: "Good but too long", score: 3, book: book_12)

review_25 = user_3.reviews.create(title: "Very Good", description: "Dragon Riders, faceless assissns, lot's of blood. nice!!!!!", score: 5, book: book_10)

author_7 = Author.create(name: "Terry Practchett")
author_8 = Author.create(name: "Neil Gaiman")

book_13 = Book.create(title: "Good Omens", pages: 288, year: 1990, authors: [author_7, author_8])

review_26 = user_11.reviews.create(title: "Very Good", description: "Awesome read!!!", score: 5, book: book_13)

review_27 = user_2.reviews.create(title: "Nice Story", description: "Good mix of horror and comedy", score: 4, book: book_13)

review_28 = user_3.reviews.create(title: "Bad", description: "hey I have to poop in something....", score: 1, book: book_13)

review_26 = user_8.reviews.create(title: "Decent", description: "It's okay", score: 3, book: book_13)
