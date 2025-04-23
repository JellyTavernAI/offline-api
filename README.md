<p align="center">
  <img src="readme-assets/readme-logo.png?raw=true" alt="JellyTavern logo" />
</p>

# JellyTavern Offline API

This is a node.js server that runs in a docker container. It manages ai cards, stories and a few other bits and pieces.

- Makes https://jellytavern.ai usable offline
- No login required
- No offline usage or content is sent to the cloud

## Brief legal disclaimer

You must read and understand the included license file before using the offline api.

Ultra short version: Only for personal use, and you are fully responsible for all content and use of the offline api.

## How to run

The offline api runs in a docker container:

**Prepwork:**

1. You must have [docker](https://docs.docker.com/engine/install/) installed
1. Download this project
1. Extract it to a folder on your computer

<p align="center">
  <img src="readme-assets/howto-download.PNG?raw=true" alt="Visual download instruction" />
</p>


**Then run it:**

1. Find the extracted folder, specifically find this file: `docker-compose.yml`
1. Run this command:<br>`docker compose up -d`

Check the webapp, find the offline configuration page and (hopefully) notice the green dot with a Status: OK.

## Where is data stored?

After running the docker command, you should find a subfolder:
- `./data`

This folder is mounted to the docker service. It contains the sqlite database and the assets (card images). The offline api reads and writes to this folder.

If you want to wipe all your data, just stop the api and delete everything from the data folder. Don't worry, the api recreates subfolders as needed.

## How to update

### Using git

When [git](https://git-scm.com/downloads) is installed on your computer:

1. Run `git pull` in the same folder as this readme file
2. Restart the docker service

The `./data` folder has an entry in `.gitignore`. It should remain intact without causing issues.

### Manual update

1. Visit the [github page](https://github.com/JellyTavernAI/offline-api)
2. Download the project
3. Replace everything except your `./data` folder

## "I have a suggestion!"

[Create an issue](https://github.com/JellyTavernAI/offline-api). Try to describe what you want and why you want it. Suggestions with obvious contribution to the greater good will likely be prioritized.

> Note: On github, even suggestions can be called "issues". Doesn't mean something is wrong :)


## "It doesn't work!"

- The webapp will try to reach http://localhost:3337, and your adblocker might not allow this
- Check the docker logs for errors
- Check the webapps console for errors

If the problem seems like a mystery or a bug, [create an issue](https://github.com/JellyTavernAI/offline-api). Try to describe what went wrong and how it happened (to the best of your ability). Well described issues are easier to solve, and more likely to be prioritized.

## A note on mental health

There is nothing wrong with immersive use of AI. In fact, it can be quite fun, engaging and even helpful.

**Just be aware:**
- It isn't a real person and it doesn't know you
- It's unpredictable
- It should not substitue real help for those that need it

> Enjoy AI responsibly and never forget: You matter &lt;3