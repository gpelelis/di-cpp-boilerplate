CC=g++
OBJCFLAGS=-I$(INCLUDEDIR) -g -std=c++11
# FINALCFLAGS=lib/BF_64.a -no-pie -g -Wall -std=c++11



# =======================
# PREPARE VARIABLE FOR INCLUDE DEPEDENCIES
INCLUDEDIR = ./include
_DEPS = stuff.hpp
DEPS = $(patsubst %, $(INCLUDEDIR)/%, $(_DEPS))



# =======================
# PREPARE VARIABLE FOR  OBJECT FILES
# create the object files into an ./obj folder
OBJDIR = ./obj
_OBJS = main.o stuff.o
OBJS = $(patsubst %, $(OBJDIR)/%, $(_OBJS))



# =======================
# FINAL COMPILATION
# $@ is the left side of :
# $^ is the right side of :
# keep this as first rule in order to be executed first
DISTDIR = ./build
main: $(OBJS)
	$(CC) -o $(DISTDIR)/$@ $^ $(FINALCFLAGS) -std=c++11


# this defines all the "main.o: ...", "file.o: ..." that are
# needed for main: $(OBJS) above
# getting the following rule before main, would execute this first 
# and would result to an error
$(OBJS): $(OBJDIR)/%.o : src/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(OBJCFLAGS) 



# =======================
# CLEANING STUFF
.PHONY: clean

BINARIES=./bin

# deletes every file from ./obj, ./build and ./bin directory
clean:
	rm -f $(OBJDIR)/*.o $(DISTDIR)/* $(BINARIES)/*