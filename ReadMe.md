# Blockchain TODO application
**With this application a household can share a todolist, every person can add or complete todo's**

## Functions
### Get todo list
with this function you can see all the todo's in the list with their indexes <br>
```
getAllTodos()
```
### add todo
with this function you can add a todo to the list <br>
```
addTodo(string todo)
```
### complete todo
You have completed a todo? Use this function to remove it from the list. Pass the todo's index along. <br>
```
completeTodo(int todoIndex)
```

## Deployment on Sepolia
This contract is currently deployed on sepolia under this address:
```0x8aa7B04298B5d4D9Ae751C6d8170D48e759022aE```

### How to use it
**1. Clone this repository** <br>
**2. Create a file called 'config.json'** <br> this file contains "MNEMONIC" (your metamask passphrase) and "INFURA_API_KEY" <br>
**3. Enter the truffle console with sepolia** <br>
```
truffle console --network sepolia
``` 
**4. Setup instane** <br>
get the abi: 
``` 
const abi = require("./build/contracts/CustomContract.json");
``` 
get instance: 
```
var instance = new web3.eth.Contract(abi['abi'],"0x8aa7B04298B5d4D9Ae751C6d8170D48e759022aE")
``` 
**5. Use methods** <br>
see list: 
```
instance.methods.getAllTodos().call()
```
add entry:
```
instance.methods.addTodo('TODO_TEXT').send({from: 'YOUR_ACCOUNT_ADDRESS', value: web3.utils.toWei("1.015")})
```
complete entry:
```
instance.methods.completeTodo(TODO_INDEX).send({from: 'YOUR_ACCOUNT_ADDRESS', value: web3.utils.toWei("1.015")})
```