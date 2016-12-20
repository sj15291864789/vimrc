export PATH=$PATH:/usr/local/Cellar/postgresql/9.4.5/bin.
export PATH=$PATH:/usr/local/Cellar/maven/3.3.3/bin
export PATH=$PATH:/usr/local/Cellar/gradle/2.4/bin
export PATH=$PATH:/usr/local/Cellar/tomcat/8.0.24/libexec/bin
export PATH=$PATH:/usr/local/lib/python2.7/site-packages
export PATH=$PATH:/Users/jshen/Downloads/activator-dist-1.3.6

export JAVA_7_HOME=`/usr/libexec/java_home -v 1.7`
export JAVA_8_HOME=`/usr/libexec/java_home -v 1.8`
export JAVA_HOME=$JAVA_8_HOME
alias java7="export JAVA_HOME=$JAVA_7_HOME"
alias java8="export JAVA_HOME=$JAVA_8_HOME"

source ~/.profile
export PATH=$PATH:/usr/local/Cellar/python/2.7.10_2/Frameworks/Python.framework/Versions/2.7/bin
export PATH=$PATH:/usr/local/Cellar/freetype/2.6_1/include/freetype2

export AWS_CLI=/usr/local/bin/aws
export IDP_USER=jian.shen
export GOPATH=/usr/local/bin
eval "$(rbenv init -)"
smiley () { echo -e ":\\$(($??50:51))"; }

[ -s "/Users/jshen/.k/kvm/kvm.sh" ] && . "/Users/jshen/.k/kvm/kvm.sh" # Load kvm
