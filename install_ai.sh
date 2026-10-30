#!/bin/bash

##########
### AI ###
##########

### Claude code ###
# @https://github.com/anthropics/skills/
# use ANTHROPIC_API_KEY

brew install --cask claude-code

echo "
To install skills, run the following commands:

claude plugin install mattpocock-skills@claude-plugins-official
/plugin marketplace add anthropics/skills
"


### Copilot ###

brew install copilot-cli

echo "
To install skills, run the following commands:

copilot plugin marketplace add mattpocock/skills
copilot plugin install mattpocock-skills@mattpocock
"


### Gemini cli ###
# Antigravity CLI too ?

npm install -g @google/gemini-cli

echo "
To install skills, run the following commands:

gemini skills install https://github.com/mattpocock/skills.git --path skills/engineering
gemini skills install https://github.com/mattpocock/skills.git --path skills/productivity
"



###########
# DESKTOP #
###########

### GOOSE
curl -fsSL https://github.com/aaif-goose/goose/releases/download/stable/download_cli.sh | bash




##########
# SKILLS #
##########

### agenticskills.io
# @https://agenticskills.io/skills/

### aiskill.market
# @https://aiskill.market/


### skills.sh
# @https://github.com/vercel-labs/skills
npx skills list -g 
npx skills add anthropics/skills@frontend-design
npx skills add vercel-labs/skills@find-skills

### Matt Pocock
# @https://aihero.dev
# then use  cd ~/.agents; mkdir matt; mv * matt 
npx skills@latest add mattpocock/skills

### verified-skill
# @https://verified-skill.com/
npx vskill@latest list
