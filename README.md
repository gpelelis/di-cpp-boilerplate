# Σχετικά με αυτό το repository
Αυτό το repository έχει δημιουργηθεί ώστε να χρησιμοποιείται ως βάση για projects c/cpp του τμήματος Πληροφορικής και Τηλεπικοινωνιών. Αυτό το boilerplate πρακτικά βοηθάει σε:
- directory organising (ξεχωριστα cpp, includes, object files, κτλ)
- makefile template (makefile που παίζει ανάλογα τα αρχεία που έχουμε στους φακέλου)
- default options για vscode build/debug (ρυθμίσεις ώστε να μπορούμε να κάνουμε build/debug μέσα από το vscode)

# Πώς να χρησιμοποιήσω αυτό το repository
1. Κάνω clone, fork ή download τοπικά
2. Ανοίγω το project μέσω [VS code](https://code.visualstudio.com/download)
3. Install [C/C++ extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
4. Πάω στο side menu Run
5. Επιλέγω "Initial Configuration" για εκτέλεση
6. Click F5
7. *debug:* Ενώ βρίσκομαι σε ένα cpp αρχείο, πατάω F9 στη γραμμή που βρίσκομαι και εισάγω breakpoint. Την επόμενη φορά που θα πατήσω F5, ο κώδικας θα κάνει break σε εκείνο το σημείο
8. *Ορίσματα εκτελέσιμου:* Τα ορίσματα εκτελέσιμου δίνονται μέσω του ./vscode/launch.json στη γραμμή 15 (πχ: "args": ["-attr", "blah.txt"])

# Πώς προσθέτω νέα αρχεία
Προκειμένου να προσθέσουμε νέα αρχεία (πχ κώδικα για ένα hashtable) χρειάζεται να κάνουμε τα παρακάτω 4 βήματα
1. Προσθήκη hpp file στο include. (πχ προσθήκη ./include/hash.hpp)
2. Προσθήκη του hpp file στο makefile (στη γραμμή 10 προσθέτουμε το όνομα του αρχείου, πχ από "_DEPS = stuff.hpp" θα γίνει "_DEPS = stuff.hpp hash.hpp") 
3. Προσθήκη cpp file στο src. (πχ προσθήκη ./src/hash.cpp)
4. Προσθήκη του παραγόμενου object file στο makefile (στη γραμμή 19 προσθέτουμε το όνομα του αρχείου, πχ από "_OBJS = main.o stuff.o" θα γίνει "_OBJS = main.o stuff.o hash.o") 

---
# Χρήσιμα
## Πώς λειτουργεί το build
1. Τη στιγμή που πατάμε F5 το vscode πάει στο ./vscode/launch.json και ελέγχει το configuration που τρέχουμε (πχ. Initial Configuration)
2. Στην συνέχεια εκτελείται το "prelaunchTask" το οποίο πρακτικά εκτελεί το "make"
3. Τελικά εκτελείται το πρόγραμμά μας σύμφωνα με τα args που έχουν δωθεί

## Χρήσιμος οδηγός
[Development/Debug με vscode αλλά εκτέλεση στα εργαστήρια Linux](https://k08.chatzi.org/vscode/linux-lab/) // από Κώστας Χατζηκοκολάκης