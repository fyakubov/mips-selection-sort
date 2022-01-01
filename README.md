# MIPS Selection Sort Example

The project demonstrates finding the kth smallest member of an array using recursive selection sort on MIPS instruction set.

### Prerequisites

QtSpim, a MIPS R3000 processor simulator, is required to run the software. Project is tested on QtSpim version 9.1.17, using simple machine setting. More on QtSpim at https://sourceforge.net/projects/spimsimulator/

### Running the demo

1. Open QtSpim and select simple machine setting. (Simulator >> Settings >> MIPS >> Simple Machine)
2. Reinitialize and load [selection.asm](src/selection.asm) (File >> Reinitialize and Load File)
3. Load [arrays.asm](src/arrays.asm) (File >> Load File)
4. Verify that Console window is open. (Window >> Console)
5. Run simulation. ('F5' or Simulator >> Run/Continue)
6. Verbose output of operation summary on each array will appear on console. 

##### Generating additional arrays

Use [arraygen.sh](utils/arraygen.sh) bash script to generate a file with new set of arrays with random elements. 

### Authors

* **Farrukh Yakubov** - [GitHub](https://github.com/fyakubov)

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
