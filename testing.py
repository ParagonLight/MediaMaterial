import csv

f = open('testing.csv','a')
iii = csv.writer(f)

iii.writerow([1])
f.close()
f = open('testing.csv','a')


iii = csv.writer(f)

iii.writerow([2])
f.close()


