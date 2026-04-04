# VGU-Project-Presentation:

A repository containing presentation slides in VGU (using `slidev` - thanks Josh for this recommendation).

## 1 Guide:

#### 1.1 Installation from scratch:

- Install `slidev` through `cmd`:

```shell
npm install @slidev/cli @slidev/theme-default
```

- Then run the below command (which could be done automatically through `VS Code Slidev Extension`):

```shell
npm exec -c 'slidev "iot-slide.md" --port 3030'
```

- You could also add the command into the `scripts` of `package.json`:
```json
{
    ...

    "scripts": {
        "dev": "slidev iot-slide.md --port 3030"
    }

    ...
}
```

#### 1.2 Installation of slide:

###### 1.2.1 Quick setup (Window Powershell):

- Install `NodeJS` and `NPM` (Node Package Manager).  
- Run `./run.ps1`.

###### 1.2.2 Setup from scratch:

- (Likewise) Install `NodeJS` and `NPM` (Node Package Manager).  
- Install necessary packages using `npm install`.  
- Run using the command below:

```shell
npm exec -c 'slidev "iot-slide.md" --port 3030'
## Or npm run dev
```