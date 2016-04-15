#! /bin/bash

#Get proxy certificate
export X509_USER_PROXY="/home/jenkins/.globus/cms_pilotcert/certs/x509_pilot12_cms.proxy"

CMSUPDATER_HOME=~/cmssite-updater

DIR="$PWD"
# export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch
# source $VO_CMS_SW_DIR/cmsset_default.sh

cd ~/releases/sl6/CMSSW_7_4_7/src
eval $(scramv1 runtime -sh) || echo "Error: $? The command 'cmsenv' failed!"

# Get WMCore from virtualenv environment
source ~/.cmssw/bin/activate

# Execute script to get CMS Sites
cd "$DIR"
"$CMSUPDATER_HOME"/bin/get_resources.py --output "$CMSUPDATER_HOME/cms_sites.txt"
"$CMSUPDATER_HOME"/bin/get_resources.py --output "$CMSUPDATER_HOME/cms_us_sites.txt" --sites "T?_US*"

cd "$DIR"
