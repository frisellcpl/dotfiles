[[ $- != *i* ]] && return

# Exports ###################################################################

export EDITOR="emacsclient -t"
export PAGER=less
export DISPLAY=:0.0

# Paths #####################################################################

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:$HOME/bin:$HOME/.gem/ruby/2.1.0/bin"
export MANPATH="/usr/local/man:$MANPATH"

# Bash history ##############################################################

export HISTCONTROL=erasedups
export HISTIGNORE="ls:exit"
export HISTSIZE=10000
unset HISTFILESIZE

shopt -s histappend
shopt -s cmdhist

# Whenever displaying the prompt, write the previous line to disk.
export PROMPT_COMMAND='history -a'

# Bash completion ###########################################################

for file in "/usr/local/etc/bash_completion" \
            "/usr/local/etc/bash_completion.d" \
            "/etc/bash_completion";
do
    if [ -f $file ]; then
        source $file
    fi
done

# Override as Bash Completion does not honor 'set expand-tilde'.
_expand() { return 0; }

# Virtualenv and pip ########################################################

export PYTHONPATH="" # Disable to work nicely with pip.
export PIP_VIRTUALENV_BASE=$HOME/.virtualenvs
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true

# shortcut to load virtual environment with same name as cwd
loadenv() {
    if [ -f env/bin/activate ] ; then
        source env/bin/activate
    else
        local venv_name=`[ -n "$1" ] && echo "$1" || echo ${PWD##*/}`
        source "$PIP_VIRTUALENV_BASE/$venv_name/bin/activate"
    fi
}

# Fabric ####################################################################

complete -o default -o nospace -W '$(fab --shortlist)' fab

# Aliases ###################################################################

alias myip="ip addr | grep -E '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | \
            grep -v '127.0.0.1' | awk '{print \$2}' && curl my-ip.heroku.com"
alias ls="ls --color"
alias vi="vim"
alias e="emacsclient -t ."
alias jnc="jnc --nox"
alias elrun="elasticsearch -f -D es.config=/home/frissan/config/elasticsearch.yml"

# Some Django convenience aliases
alias djrun='./manage.py runserver'
alias djunicorn='./manage.py run_gunicorn'
alias djsync='./manage.py syncdb'
alias djshell='./manage.py shell'
alias djdb='./manage.py dbshell'
alias djsql='./manage.py sql'
alias djtest='./manage.py tests'
alias djvalidate='./manage.py validate'
alias djmakemessages='./manage.py makemessages'
alias djcompilemessages='./manage.py compilemessages'
alias djm='./manage.py migrate'
alias djmm='./manage.py makemigrations'

# Remove all .pyc and .pyo files in tree
alias cleanpy="find . -name '*.py[oc]' -delete"

# Misc ######################################################################

shopt -s checkwinsize

# Prompt ####################################################################

if [ $(command -v __git_ps1) ]; then
    PS1='[\u@\h]\W$(__git_ps1 ":%s")% '
else
    PS1='[\u@\h]\W\[\033[0;31m\]\$\[\033[0m\] '
fi

# Local Config ##############################################################

if [ -e "$HOME/.bashrc.local" ]; then
    source "$HOME/.bashrc.local"
fi

# Audio ##############################################################

pulseaudio --start
