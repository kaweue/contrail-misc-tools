import etcd3
import json
import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Finds contrail object in etcd')
    #TODO read configuration from contrail configuration yaml
    parser.add_argument('--host', help="etcd host", default="localhost")
    parser.add_argument('--port', help="etcd port", default=2379)
    parser.add_argument('--uuid', help="uuid of contrail resource", required=True)
    args = parser.parse_args()

    etcd_client = etcd3.client(host=args.host, port=args.port)
    for value, key in etcd_client.get_prefix("/contrail"):
        resource = json.loads(value)
        if len(resource) is not 1:
            continue 
        _, obj_dict = next(iter(resource.items()))
        if args.uuid == obj_dict["uuid"]:
            print(json.dumps(resource, indent=4))


