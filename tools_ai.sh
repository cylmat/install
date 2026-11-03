#!/bin/bash

##########
### AI ###
##########


### Claude code ###
# @https://github.com/anthropics/skills/
# use ANTHROPIC_API_KEY

brew install --cask claude-code


### Copilot ###

brew install copilot-cli


### Gemini cli ###
# Antigravity CLI too ?

npm install -g @google/gemini-cli



### OPENCODE ###
# @https://opencode.ai/

npm install -g @opencode/cli


###############
### INSTALL ###
###############


# Just symlink ~/.agents/skills for instructions and Claude
```shell
mkdir -p ~/.agents/skills/custom ~/.agents/agents/custom ~/.claude ~/.copilot ~/.gemini

ln -s ~/.agents/instructions.md ~/.claude/CLAUDE.md
ln -s ~/.agents/instructions.md ~/.copilot/copilot-instructions.md
ln -s ~/.agents/instructions.md ~/.gemini/GEMINI.md
```



###############
### DESKTOP ###
###############

### GOOSE
curl -fsSL https://github.com/aaif-goose/goose/releases/download/stable/download_cli.sh | bash





###############
### PLUGINS ###
###############

### CUSTOM

claude plugin marketplace add ~/.claude/plugins/my-plugin
claude plugin install my-plugin@my-marketplace


### MATT POCOCK
# https://aihero.dev

claude plugin install mattpocock-skills@claude-plugins-official
claude plugin marketplace add anthropics/skills

copilot plugin marketplace add mattpocock/skills
copilot plugin install mattpocock-skills@mattpocock

gemini skills install https://github.com/mattpocock/skills.git --path skills/engineering
gemini skills install https://github.com/mattpocock/skills.git --path skills/productivity



### AWESOME SKILLS ###
# https://awesome-skills.com

### Seth Hobson
# https://sethhobson.com
# https://github.com/wshobson/agents

claude plugin marketplace add wshobson/agents



### AWESOME CLAUDE SKILLS ###
# @https://awesomeclaude.ai/awesome-claude-skills


##############
### SKILLS ###
##############

### agenticskills.io
# @https://agenticskills.io/skills

### aiskill.market
# @https://aiskill.market

### ComposioHQ
# @https://github.com/ComposioHQ/awesome-claude-skills

### Mcpservers.org
# @https://mcpservers.org/fr/agent-skills




### skills.sh
# @https://github.com/vercel-labs/skills
npx skills list -g
npx skills add anthropics/skills@frontend-design
npx skills add vercel-labs/skills@find-skills
  # Usage: npx skills add vercel-labs/agent-skills --skill web-design-guidelines -a claude-code

### Matt Pocock
# @https://aihero.dev
# then use  cd ~/.agents; mkdir matt; mv * matt 
npx skills@latest add mattpocock/skills

### verified-skill
# @https://verified-skill.com/
npx vskill@latest list
