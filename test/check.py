from hashlib import sha1
import boto3
import json
import os

ten_chars = "0123456789"
one_hudred_chars = ten_chars * 10
checksum = sha1(one_hudred_chars.encode()).hexdigest()

def expected(prefix_length, separator, checksum_length):
    return one_hudred_chars[0:prefix_length] + separator + checksum[0:checksum_length]

outputs = json.loads(os.environ['TF_OUTPUTS'])

assert outputs['not_transformed']['value'] == ten_chars
assert outputs['defaults']['value'] == expected(11, '-', 4)
assert outputs['defaults_15']['value'] == expected(10, '-', 4)
assert outputs['defaults_52']['value'] == expected(39, '-', 12)