# ZSH-GPT

Simple ZSH plugin to allow querying ChatGPT from the command line. Inspired by and based on (1000x Engineer)[https://kadekillary.work/posts/1000x-eng/] by Kade Killary. See that post
for more great examples.

``````
```
❯ g hello world
Hello there! How can I assist you today?

❯ g how do I change the date on linux
To change the date on Linux, you can use the "date" command with the appropriate parameters.

For example, to set the date to January 1, 2025 at 12:00 AM, you could use the following command:
sudo date -s "01 JAN 2025 00:00:00"

The "s" option specifies that you want to set the date and time, and the argument following it should be the date and time you want to set.

You will need to run this command as root (using "sudo") in order to have the necessary permissions to change the system date.

❯ g write a zsh command to extract the third field from a csv
Assuming the csv is delimited by commas, you can use the `cut` command to extract the third field:

zsh
cut -d',' -f3 <file.csv>

This will print out the third field of each line in the csv file. If you want to save the output to a new file, you can use output redirection:

zsh
cut -d',' -f3 <file.csv> > newfile.txt
```

## Install

### Plugin Managers
Add antonjs/zsh-gpt using whatever format the plugin manager expects:
```
zinit light antonjs/zsh-gpt
antigen bundle antonjs/zsh-gpt
antidote bundle antonjs/zsh-gpt
```

Set OPENAI_API_KEY in `.zshrc` or otherwise:
`OPENAI_API_KEY = [key]`

### Manual
1. Clone this repository: `git clone https://github.com/antonjs/zsh-gpt ~/.zsh/zsh-gpt`
2. Source the plugin in your `.zshrc`: `source ~/.zsh/zsh-gpt/zsh-gpt.plugin/zsh`
3. Set OPENAI_API_KEY in `.zshrc` or otherwise:
  `OPENAI_API_KEY = [key]`
4. Start a new terminal session

## Usage
+ Type `g [query]` where `query` is your question.
+ Use quotes, or not, but be aware of symbols like quotes:
  `g What is the graphical file browser on Ubuntu`
  `g "What's Ubuntu's graphical file browser called?`
+ Provide data using subcommands, be careful of quotes:
  `g "Calculate the average PointsPerGame by Position from the following:" $(cat nba.csv | sed 's/"//g')`
