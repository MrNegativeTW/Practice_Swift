import UIKit
//: #### I put my cat here, don't scare him.
//: ![Cat](cat.jpg)

/*:
 ### This is a basic array.
 */
var Arr = ["A", "B", "C"]

print(Arr[0])

/*:
 ### Dictionary
 
 - Create a new
 - Append it
 */

var dictionary = ["Device": "iMac", "Model": "iMac18,3"]
print(dictionary)

dictionary["CPU"] = "Intel Core i7"
print(dictionary)

/*:
 ### Loop through entire dict and
 
 - Print keys
 - Print values
 */

for i in dictionary.keys {
    print(i)
}

for i in dictionary.values {
    print(i)
}


