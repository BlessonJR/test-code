data = {"a":{"b":{"c":"m"}}}
find_value = "c"

def value_check(d,g):
  
    for k ,v in d.items():
        if k == g:
            print('value for the key ' + k + ' is ' + v)
       

        elif type(v) == dict:
            value_check(v,g)

        else:
            print("Key doesnt exsist")

value_check(data,find_value)
