source 'https://supermarket.chef.io'

def company_cookbook(name, version = '>= 0.0.0', options = {})
  cookbook(name, version, { git: "https://github.com:EagleGenomics-cookbooks/#{name}.git" }.merge(options))
end

company_cookbook 'HMMER'
company_cookbook 'blast'
company_cookbook 'augustus'

metadata
