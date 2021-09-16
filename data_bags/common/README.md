You have already shown them how to create a databag & databag item via CLI (with dummy key-value pairs)
```
knife data bag create common variables
```
Here you are showing them how to add a new item to the same databag via a file 

### Notes:
* MUST ensure you are in the chef-repo/ folder when you execute this
* To upload item from file into the databag you must ensure that you have already created the data bag

```
PS C:\Users\windows\chef-repo> knife data bag from file common company_info.json
```

You can upload all json files in a folder using the -a flag
```
knife data bag from file users -a
```
This will upload all the JSON files in the data_bag/users folder

