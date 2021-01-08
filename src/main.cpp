#include "../include/stuff.hpp"

#include <string>

using namespace std;

int main(int argc, char* argv[]){
    string operation;

    // reading parameters like ./executable -attr value -attr2 value2
    // -r for recordFile
    for (int index = 1; index < argc; index = index + 2){
        string attr(argv[index]);
        string value(argv[index+1]);

        if (attr.compare(string("-r")) == 0){
            operation = value;
        } 
    }

    // do stuff
    Stuff stuff;

    // bye
    return 0;
}