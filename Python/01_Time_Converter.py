minutes = int(input("Enter the number of minutes: "))
hrs = minutes // 60
mins = minutes % 60
if hrs < 1:
    print(f"{mins} minutes")
elif mins < 1 and hrs < 2:
    print(f"{hrs} hour")
elif mins < 1:
    print(f"{hrs} hours")
elif hrs < 2 and mins < 2:
    print(f"{hrs} hour {mins} minute")
elif hrs < 2:
    print(f"{hrs} hour {mins} minutes")
elif mins < 2:
    print(f"{hrs} hours {mins} minute")
else:
    print(f"{hrs} hours {mins} minutes")