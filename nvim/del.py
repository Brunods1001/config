"""
A script that takes a name argument and prints a greeting
"""

import sys

def main():
    """The main function"""
    print("Hello, " + sys.argv[1] + "!")
    print("Goodbye, " + sys.argv[1] + "!")

if __name__ == "__main__":
    main()

