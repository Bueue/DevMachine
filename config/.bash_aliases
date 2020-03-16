alias l='ls -lah'
alias ..='cd ..'
alias c='clear'

# Put here your company aliases, deleting the following examples:

# SSH Example
alias yourfarm-ssh='ssh ${DEVELOPER_ID}@yourfarm'
# Composer example
alias composer='docker run --rm -ti -v $(pwd):/app -v $HOME/.composer/cache:/tmp --name=composer -u $(id -u):$(id -g) composer "$@"'
# Docker registry example
alias your-docker-registry-login='docker login -u ${DEVELOPER_EMAIL} your-registry'
alias your-registry-logout='docker logout your-registry'
# OpenShift oc Client Tools example
alias oc-login='oc login your-openshift -u ${DEVELOPER_EMAIL}'
alias oc-logout='oc logout'