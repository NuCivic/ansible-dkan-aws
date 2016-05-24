#!/bin/bash
# ------------------------------------------------------------------
# [NuCivic] DKAN Site Setup 
#           Takes git url and dataset credentials to setup single site. 
# ------------------------------------------------------------------

SUBJECT=dkan-site-setup
VERSION=0.1.0
USAGE="Usage: dkan-site-setup -hv GIT_URL git_branch/tag/commit database_host database_port database_name database_user database_pass"

# --- Option processing --------------------------------------------
if [ $# == 0 ] ; then
    echo $USAGE
    exit 1;
fi

while getopts ":vh" optname
  do
    case "$optname" in
      "v")
        echo "Version $VERSION"
        exit 0;
        ;;
      "h")
        echo $USAGE
        exit 0;
        ;;
      "?")
        echo "Unknown option $OPTARG"
        exit 0;
        ;;
      ":")
        echo "No argument value for option $OPTARG"
        exit 0;
        ;;
      *)
        echo "Unknown error while processing options"
        exit 0;
        ;;
    esac
  done

shift $(($OPTIND - 1))

GIT_URL=$1
GIT_COMMIT=$2
DB_HOST=$3
DB_PORT=$4
DB_NAME=$5
DB_USER=$6
DB_PASS=$7

WEBROOT="/var/www/html"

# -----------------------------------------------------------------

LOCK_FILE=/tmp/${SUBJECT}.lock

if [ -f "$LOCK_FILE" ]; then
echo "Script is already running"
exit
fi

# -----------------------------------------------------------------
trap "rm -f $LOCK_FILE" EXIT
touch $LOCK_FILE 

# -----------------------------------------------------------------
#  FUNCTIONS 
# -----------------------------------------------------------------
create_webroot () {
  rm -rf $WEBROOT
  git clone $GIT_URL $WEBROOT
}

checkout_git () {
  cd $WEBROOT
  git pull
  git checkout $GIT_COMMIT
}

add_local_settingsphp () {
  # Copied from ahoy. TODO: add ahoy to AMI.
  rm -f $WEBROOT/assets/sites/default/settings.local.php
  sed  \
  -e s/#DB_HOST/$DB_HOST/g \
  -e s/#DB_USER/$DB_USER/g \
  -e s/#DB_PASS/$DB_PASS/g \
  -e s/#DB_PORT/$DB_PORT/g \
  -e s/#DB_NAME/$DB_NAME/g \
  $WEBROOT/assets/sites/default/settings.local.demo.php > $WEBROOT/assets/sites/default/settings.local.php
  echo "A settings.local.php file was created at assets/sites/default/settings.local.php with your db credentials."

}

# -----------------------------------------------------------------
#  SCRIPT LOGIC
# -----------------------------------------------------------------
if [ ! -f "$WEBROOT/docroot/index.php" ]; then
    create_webroot
    checkout_git 
    add_local_settingsphp
else
    checkout_git 
fi

