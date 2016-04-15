#! /bin/env python

# List CMS Sites
# This requires the user to setup CMSSW and CRAB3 or WMCore
# before being able to use the script

import argparse
import fnmatch

parser = argparse.ArgumentParser(description='List CMS Sites')
parser.add_argument("-o", "--output", help="Output filename")
parser.add_argument("-s", "--sites", type=str, help="constraint site names with wilcards e.g: --sites=T?_US*")
args = parser.parse_args()

from WMCore.Services.SiteDB.SiteDB import SiteDBJSON
db = SiteDBJSON({'cacheduration': 24})
cmsnames = db.getAllCMSNames()

if args.sites:
    cmsnames = fnmatch.filter(cmsnames, args.sites)

sitelist = ",".join(cmsnames)

if args.output:
    with open(args.output, 'w') as output_file:
        output_file.write(sitelist)
else:
    print sitelist

#for site in cmsnames:
#    print site
