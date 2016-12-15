import json
from elasticsearch import Elasticsearch 
import ast


# Expects a json file containing the backup. File is generated using elasticdump
# Script is not smart and hence the backfile must be named as data.json
# data.json file must be in the same directory as that of this script
# Script must be executed locally on ELK server
# Connect to elasticsearch 
es = Elasticsearch([{'host':'localhost','port':9200}])

fp = open("data.json", "r")
for line in fp:
	d = ast.literal_eval(line)
        source_dict = d["_source"]
	json_dict = json.dumps(source_dict)
	es.index(index="vlabs", doc_type="usage", body=json_dict)

