# Get and install
composer global require weprovide/valet-plus

valet fix
valet install --with-mariadb

# Create dev ENV
mkdir ~/projects
valet park ~/projects

mkdir ~/projects/react
mkdir ~/projects/vue

mkdir ~/projects/magento
valet park ~/projects/magento

mkdir ~/projects/wordpress
valet park ~/projects/wordpress

mkdir ~/projects/joomla
valet park ~/projects/joomla
