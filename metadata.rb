name 'busco'
maintainer 'Eagle Genomics Ltd'
maintainer_email 'chef@eaglegenomics.com'
license 'apachev2'
description 'Installs/Configures BUSCO'
long_description 'Installs/Configures BUSCO'
source_url 'https://github.com/EagleGenomics-cookbooks/busco'
issues_url 'https://github.com/EagleGenomics-cookbooks/busco/issues'
version '1.0.1'

depends 'build-essential'
depends 'HMMER'
depends 'blast'
depends 'augustus'
depends 'poise-python', '~> 1.4.0'
