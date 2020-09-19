<p align="center"><img src="https://user-images.githubusercontent.com/1377253/93661464-edf77780-fa4f-11ea-9622-86cf7e34d460.png" height="80" /></p>

<h1 align="center">HaxeFlixel Game Template</h1>

<h3 align="center">Everything you need to start making your HF game in 2-3 terminal commands</h3>

<p align="center">No need to install <a href="https://haxe.org/">Haxe</a>, <a href="https://www.openfl.org/">OpenFL</a>, <a href="https://lime.software/">Lime</a> or <a href="https://haxeflixel.com/">HaxeFlixel</a> separately. <br />This template takes care of all of that with the power of <a href="https://github.com/lix-pm/lix.client">Lix</a> and <a href="https://nodejs.org/en/">Nodejs</a>.</p>

---

*This template requires [Nodejs](https://nodejs.org/en/)(v6 or higher) to be installed to run most of the commands below.*

### 1. Download

#### a. As a Github template
This is a [template repository](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template), simply click "Use this template" to create a copy of it on your own GitHub account!

![](https://help.github.com/assets/images/help/repository/use-this-template-button.png)

#### b. As a non-Github template
You can also create a new project based on this template using [degit](https://github.com/Rich-Harris/degit) which will ignore all .git related files.
```sh
npx degit RichardBray/game-jam-template my-flixel-game
cd my-flixel-game
```

### 2. Install dependencies

```sh
npm i 
```

### 3. Build
It's recommended to have a compilation server when developing to cache the compilation, this should be done in a separate tab with the following command.
```sh
npm run comp-server
```

Your .hx files are watched with Facebook's watman plugin. Anytime you save a file it will trigger an automatic rebuild. 
```sh
npm start 
```
