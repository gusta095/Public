import redis

HOST = 'endpoint-do-redis'

def get_all_keys():
    REDIS = redis.StrictRedis(host=HOST, port=6379, db=0)
    print(REDIS.keys('*'))

def get_all_keys_inline():
    REDIS = redis.StrictRedis(host=HOST, port=6379, db=0)
    for key in REDIS.keys('*'):
        print(key)

def count_all_keys():
    COUNT = 0
    REDIS = redis.StrictRedis(host=HOST, port=6379, db=0)
    for key in REDIS.keys('*'):
        COUNT += 1
        print(key)
    print(f'total keys: {COUNT}')

def seach_keys():
    REDIS = redis.StrictRedis(host=HOST, port=6379, db=0)
    for key in REDIS.scan_iter("info"):
        print(key)

def delete_key():
    REDIS = redis.StrictRedis(host=HOST, port=6379, db=0)
    DELETE = REDIS.delete('info')
    if DELETE == 1:
        print(f'Success delete key')





