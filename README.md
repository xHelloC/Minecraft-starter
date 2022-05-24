# Minecraft starter
### Supported OS: **Windows 7 - 11**
### Supported products: **purpur, waterfall, spigot**
### Supported versions: **1.12.2 - 1.19**

.
don't be shy to report bugs, this repository is open, so bugs will be addressed and new versions will be release
.

![image info](https://i.ibb.co/rcTSD3x/image.png)

`usage`
> open cmd.. *Command promt* from file whenre is located the **starter.bat**

> or you can basically create another file **.bat**

```powershell
start starter.bat --name "YourName" --flags etc...
```

```md
<string>.bat --name "<string>" [--flags ["<string>"akair" (custom|nromal)] --Min<integer><string>(M|G) --Max<integer><string>(M|G) [(--purpur|--waterfall|--spigot)] [--version [(<version>)]]
```
`example`
```
./starter.bat --name "Test" #Expected server.jar
./starter.bat --name "Test" --flags  *#Noflags*  #Expected server.jar
./starter.bat --name "Test" --flags "akair" normal *#Basic flags 4GB*  
./starter.bat --name "Test" --flags "akair" custom --Min1G --Max1G --purpur --version *# Downloaded the latest..*
./starter.bat --name "Test" --flags "akair" custom --Min1G --Max1G --purpur --version "1.18" *# Specific version*
```
![image info](https://i.ibb.co/kgB30Gk/image.png)
![image info](https://i.ibb.co/zNvC9P2/image.png)


`./starter.bat --name "Test" --flags "akair" normal`
>
![image info](https://i.ibb.co/cbpKBBt/image.png)

`./starter.bat --name "Test" --flags "akair" custom --Min1G --Max1G --purpur --version "1.18"`
![image info](https://i.ibb.co/h9ffBBf/image.png)
