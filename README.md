# GettingAndCleaningData - README.md

This repository contains all files required from the Programming Assignment of the "Getting And Cleaning Data" course at coursera.

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The files submitted in this repository are:

* A tidy data set called cleandataset.txt (which is the result of the execution of the R script run_analysis.R)
* A code book that describes the variables, the data, and any transformations or work performed to clean up the data called CodeBook.md
* A R script called run_analysis.R, which reads raw data from a URL and transforms them into a tidy data set
* This README file

A bit more in detail, the R script is divided into five functions: four do the actual elaborations and the last one, run_analysis(), puts their results together and writes them into two txt files (one for the tidy data, and one that contains the timestamp of the download).

IMPORTANT - contrary to what the assignment says, you don't need to have the raw data already present in your working directory: run_analysis() will create for you a new folder into which you will find everything (the raw data downloaded from the internet, and the tidy data). The download may take a bit of time, depending on your internet connection.

More information regarding the functions can be found in run_analysis.R
