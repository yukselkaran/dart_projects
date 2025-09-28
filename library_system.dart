import 'dart:io';

void main(List<String> args) {
  List<Map<String,dynamic >> books = [
  {
    "title": "Crime and Punishment",
    "author": "Fyodor Dostoevsky",
    "genre": "Psychological Fiction",
    "year": 1866,
    "isRead": true
  },
  {
    "title": "1984",
    "author": "George Orwell",
    "genre": "Dystopian",
    "year": 1949,
    "isRead": true
  },
  {
    "title": "The Overcoat",
    "author": "Nikolai Gogol",
    "genre": "Short Story",
    "year": 1842,
    "isRead": true
  },
  {
    "title": "Fahrenheit 451",
    "author": "Ray Bradbury",
    "genre": "Dystopian",
    "year": 1953,
    "isRead": false
  },
  {
    "title": "The Republic",
    "author": "Plato",
    "genre": "Philosophy",
    "year": -380,
    "isRead": true
  },
  {
    "title": "Thus Spoke Zarathustra",
    "author": "Friedrich Nietzsche",
    "genre": "Philosophy",
    "year": 1883,
    "isRead": true
  },
  {
    "title": "Brave New World",
    "author": "Aldous Huxley",
    "genre": "Dystopian",
    "year": 1932,
    "isRead": false
  },
  {
    "title": "Notes from Underground",
    "author": "Fyodor Dostoevsky",
    "genre": "Psychological Fiction",
    "year": 1864,
    "isRead": false
  },
  {
    "title": "The Trial",
    "author": "Franz Kafka",
    "genre": "Philosophical Fiction",
    "year": 1925,
    "isRead": false
  },
  {
    "title": "Meditations",
    "author": "Marcus Aurelius",
    "genre": "Philosophy",
    "year": 180,
    "isRead": false
  }
];
  print("==== LIBRARY SYSTEM ====");
  print("1. add books");
  print("2. list books");
  print("3. list the books that not read yet");
  print("4. filter books by their type");
  print("5. update the read status");
  print("6. remove a book");
  print("Please choose from [1-6] : ");
  int choice = int.parse(stdin.readLineSync()!);
  switch(choice){
    case 1: 
    books.add(addBooks());
    print("book has been added successfully");
    listBooks(books);
    break;

    case 2: 
    listBooks(books);
    break;

    case 3: 
    notReadYetBooks(books);
    break;
    
    case 4: 
    filterBooks(books);
    break;

    case 5:
    print("\nWhich book did you read: ");
    int i=1;
    for(var book in books){
      print("$i. ${book["title"]}");
      i++;
    }
    int bookNumber = int.parse(stdin.readLineSync()!);
    updateReadStatus(books, bookNumber);
    listBooks(books);
    break;

    case 6:
    print("\nWhich book do you want to remove: ");
    int i=1;
    for(var book in books){
      print("$i. ${book["title"]}");
      i++;
    }
    int bookNumber = int.parse(stdin.readLineSync()!);
    removeBook(books, bookNumber);
    listBooks(books);
    break;

    default:
      print("Invalid input.");
  }
}
Map<String,dynamic> addBooks(){
  print("title: ");
  String? title = stdin.readLineSync();
  print("author: ");
  String? author = stdin.readLineSync();
  print("genre: ");
  String? genre = stdin.readLineSync();
  print("year: ");
  int year = int.parse(stdin.readLineSync()!);
  print("isRead: ");
  String? boolInput = stdin.readLineSync();
  bool isRead = boolInput?.toLowerCase().trim() == 'true';

  Map<String,dynamic> newBook = {
    "title" : "$title",
    "author" : "$author",
    "genre" : "$genre",
    "year" : "$year",
    "isRead" : "$boolInput"
  };
  return newBook;
}

void listBooks(List<Map <String,dynamic>> books){
  for(var book in books){
    print("Title : ${book["title"]}");
    print("Author : ${book["author"]}");
    print("Genre : ${book["genre"]}");
    print("Year : ${book["year"]}");
    print("isRead : ${book["isRead"]}");
    print("-----------------------");
  }
}

void notReadYetBooks(List<Map <String,dynamic>> books){
  for(var book in books){
    if(book["isRead"] == false){
      print("this book is not read yet : ${book["title"]}");
    }else{
      continue;
    }
  }
}

// // Yanlış düşündüğüm filtreleme algoritması.
// void filterBooks(List<Map <String,dynamic>> books){
//   for(int i=0;i<books.length;i++){
//     String genre = books[i]["genre"];
//     for(int j=i+1;j<books.length;j++){
//       if(genre == books[j]["genre"]){
//         print("${books[i]["title"]} and ${books[j]["title"]} have same genre");
//       }
//       else{
//         continue;
//       }
//     }
//   }
// }

void filterBooks(List<Map <String,dynamic>> books){
  Set<String> genres  = Set();
  for(var book in books){
    genres.add(book["genre"]);
  }
  for (var genre in genres) {
    print("Genre: $genre");
    for (var book in books) {
      if (book["genre"] == genre) {
        print("- ${book["title"]}");
      }
    }
    print("-----------------------");
  }
}

void updateReadStatus(List<Map <String,dynamic>> books,int bookNumber){
  books[bookNumber-1]["isRead"] = true;
  print("The read status has been updated."); 
}

void removeBook(List<Map <String,dynamic>> books,int bookNumber){
  books.remove([bookNumber-1]);
  print("Remove operation has completed successfully.");
}