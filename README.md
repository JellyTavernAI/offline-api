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

* You must install [docker](https://docs.docker.com/engine/install/)
* You should install [git](https://git-scm.com/downloads)

**Get the api:**

1. Recommended: Use git to clone this repository:<br>`git clone https://github.com/JellyTavernAI/offline-api.git`
1. Alternative: _Download this repository and extract to a folder_
1. Find the folder with this file: `docker-compose.yml` (in root folder)
1. Run this command:<br>`docker compose up -d`

**Verify success:**

- Check the [offline configuration page](https://jellytavern.ai/config/overview).
- Make sure enable the Offline API (toggle to "enabled")
- The status box should say "OK" with a green dot and a checkmark<br>Like this image:

<p>
  <img src="readme-assets/howto-config.png?raw=true" alt="Screenshot of valid offline api config" />
</p>

## Where is data stored?

After running the docker command, you should find a subfolder:
- `./data`

This folder is mounted to the docker service. It contains the sqlite database and the assets (card images). The offline api reads and writes to this folder.

If you want to wipe all your data, just stop the api and delete everything from the data folder. Don't worry, the api recreates subfolders as needed.

## How to update

### Recommended: Using git

If you used [git](https://git-scm.com/downloads) to pull the repository:

1. Run `git pull` in the same folder as this readme file
2. Restart the docker service

The `./data` folder has an entry in `.gitignore`. It should remain intact without causing issues.

### Alternative: Manual update

1. Visit the [github page](https://github.com/JellyTavernAI/offline-api)
2. Download the project
3. Replace everything except your `./data` folder

## "I have a suggestion!"

[Create an issue](https://github.com/JellyTavernAI/offline-api). Try to describe what you want and why you want it. Suggestions with obvious contribution to the greater good will likely be prioritized.

> Note: On github, even suggestions can be called "issues". Doesn't mean something is wrong :)

You can also make suggestions in the [JellyTavern AI subreddit](https://www.reddit.com/r/JellyTavernAI/)

## "It doesn't work!"

- The webapp will try to reach http://localhost:3337, and your adblocker might not allow this
- Check the docker logs for errors
- Check the webapps console for errors

If the problem seems like a mystery or a bug, [create an issue](https://github.com/JellyTavernAI/offline-api). Try to describe what went wrong and how it happened (to the best of your ability). Well described issues are easier to solve, and more likely to be prioritized.

You can also try asking in the [JellyTavern AI subreddit](https://www.reddit.com/r/JellyTavernAI/)

## A note on mental health

There is nothing wrong with immersive use of AI. In fact, it can be quite fun, engaging and even helpful.

**Just be aware:**
- It isn't a real person and it doesn't know you
- It's unpredictable
- It should not substitue real help for those that need it

> Enjoy AI responsibly and never forget: You matter &lt;3