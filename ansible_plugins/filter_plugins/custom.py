from jinja2.utils import soft_unicode

def get_subnets(value, tag_key, tag_value, return_type='subnet_id'):
    subnets = []
    for item in value:
      for key, value in item['subnet']['tags'].iteritems():
        if key == tag_key and value == tag_value:
          subnets.append(item['subnet']['id'])
    return subnets

def get_nat(value, placement, return_type='nat_id'):
    id = ''
    for item in value:
      if item['instances'][0]['placement'] == placement:
        id = item['instances'][0]['id']
    return id


class FilterModule(object):
    ''' Ansible jinja2 filters '''

    def filters(self):
        return {
            'get_subnets': get_subnets,
            'get_nat': get_nat,
        }
