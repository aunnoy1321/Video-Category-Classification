import csv
            
def readFileAndComputeAverageOfAlgorithmCombinations(fileName):
    algoCombosDict = {}

    with open(fileName, newline='') as csvfile:
        spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')

        for row in spamreader:
            algoCombos = '';

            for algo in row[1:5]:
                algoCombos = algoCombos + algo + ' '

            if algoCombos in algoCombosDict.keys():
                algoCombosDict[algoCombos][0] += float(row[5])
                algoCombosDict[algoCombos][1] += float(row[6])
                algoCombosDict[algoCombos][2] += 1
                
            else:
                algoCombosDict[algoCombos] = [0, 0, 0]

                algoCombosDict[algoCombos][0] += float(row[5])
                algoCombosDict[algoCombos][1] += float(row[6])
                algoCombosDict[algoCombos][2] += 1

    for key, value in algoCombosDict.items():
        algoCombosDict[key][0] /= algoCombosDict[key][2]
        algoCombosDict[key][1] /= algoCombosDict[key][2]

    return algoCombosDict


def writeInFile(fileName, algoCombosDict):
    algoCombosList = []
    for key, value in algoCombosDict.items():
        algos = key.split()
        algos.append(str(algoCombosDict[key][0]))
        algos.append(str(algoCombosDict[key][1]))
        algoCombosList.append(algos)

    with open(fileName, "w+") as csv_file:
        writer = csv.writer(csv_file, delimiter=',')
        for line in algoCombosList:
            writer.writerow(line)


##dataTypes = ["Raw", "SWT", "SWTSD"]
##devices = ["Muse", "Emotiv"]
##
##for data in dataTypes:
##    for device in devices:
##        if device == "Muse":
##            channelNames = ["TP9", "AF7", "AF8", "TP10"]
##        else:
##            channelNames = ["AF3", "F7", "F3", "FC5", "T7", "P7", "O1", "O2", "P8", "T8", "FC6", "F4", "F8", "AF4"]
##
##        for channel in channelNames:
##            fileName = device + " " + channel + " " + data
##
##            algoCombosDict = readFileAndComputeAverageOfAlgorithmCombinations(fileName + ".csv")
##
##            writeInFile("Combination of Algorithms (Average of Subjects)\\" + fileName + " " + "Average of Subjects.csv", algoCombosDict)


##device = "Muse"
##channel = "TP9"
##data = "Raw"
##
##fileName = device + " " + channel + " " + data
##
##algoCombosDict = readFileAndComputeAverageOfAlgorithmCombinations(fileName + ".csv")
##
##writeInFile("Combination of Algorithms (Average of Subjects)\\" + fileName + " " + "Average of Subjects.csv", algoCombosDict)















        
