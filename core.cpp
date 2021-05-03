/*
 * Motor de historias interactivas
 * Por Bowuigi
 * Mi primer proyecto en C++
 * Hecho con GVim, en Linux (Ubuntu para ser específicos)
 * Para la feria de ciencias
*/

#include "core.hpp"
#include <string>
using namespace std;

int main() {
		string filename = "testfile.txt";
		cout << readFile(filename);
}

std::string readFile(std::string filename) {
		// Abrir el archivo

		ifstream file;
		file.open(filename,ios::in);
		
		if (!file) {
				cerr << filename << ": no such file or directory" << endl;
				return "";
		}

		// Leer el archivo
		string text;
		string line;

		bool first=true;

		while (true) {
				getline(file,line);
				if (file.fail()) {
						break;
				}
				// Añadir una linea y después el texto
				if (first) {
						text.append(line);
				} else {
						text.append("\n").append(line);
				}
				first=false;
		}	
		// Close the file
		file.close();
		return text;
}

