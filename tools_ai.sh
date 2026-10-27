#!/bin/bash

##########
### AI ###
##########

### Claude code ###

# use ANTHROPIC_API_KEY
# claude plugin install mattpocock-skills@claude-plugins-official

brew install --cask claude-code

### Copilot ###

# copilot plugin marketplace add mattpocock/skills
# copilot plugin install mattpocock-skills@mattpocock

brew install copilot-cli

### Gemini cli ###
# gemini skills install https://github.com/mattpocock/skills.git --path skills/engineering
# gemini skills install https://github.com/mattpocock/skills.git --path skills/productivity


npm install -g @google/gemini-cli




###########
# DESKTOP #
###########

### GOOSE
curl -fsSL https://github.com/aaif-goose/goose/releases/download/stable/download_cli.sh | bash




##########
# SKILLS #
##########

npx skills list -g 
npx skills add vercel-labs/skills@find-skills

# Matt Pocock
# then use  cd ~/.agents; mkdir matt; mv * matt 
npx skills@latest add mattpocock/skills
