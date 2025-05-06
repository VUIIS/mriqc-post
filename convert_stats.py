#!/usr/bin/env python

import argparse
import glob
import json
import pandas

parser = argparse.ArgumentParser()
parser.add_argument('--bids_dir', required=True)
parser.add_argument('--anatfunc', required=True)
parser.add_argument('--out_dir', required=True)
args = parser.parse_args()

json_files = glob.glob(f'{args.bids_dir}/sub*/ses*/{args.anatfunc}/*.json')

if len(json_files) != 1:
    raise Exception(f'Found {len(json_files)} JSON instead of 1')

with open(json_files[0],'r') as json_file:
	json_data = json.load(json_file);

json_data.pop('bids_meta');
json_data.pop('provenance');

csv_data = pandas.DataFrame(json_data, index=[0])
csv_data.to_csv(f'{args.out_dir}/mriqc.csv')
