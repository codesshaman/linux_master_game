name = Linux Master

NO_COLOR=\033[0m		# Color Reset
COLOR_OFF='\e[0m'       # Color Off
OK_COLOR=\033[32;01m	# Green Ok
ERROR_COLOR=\033[31;01m	# Error red
WARN_COLOR=\033[33;01m	# Warning yellow
RED='\e[1;31m'          # Red
GREEN='\e[1;32m'        # Green
YELLOW='\e[1;33m'       # Yellow
BLUE='\e[1;34m'         # Blue
PURPLE='\e[1;35m'       # Purple
CYAN='\e[1;36m'         # Cyan
WHITE='\e[1;37m'        # White
UCYAN='\e[4;36m'        # Cyan

all:
	@printf "Launch configuration ${name}...\n"
	@vagrant up --provider=virtualbox

help:
	@echo -e "$(OK_COLOR)==== All commands of ${name} configuration ====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- make				: Launch configuration"
	@echo -e "$(WARN_COLOR)- make build			: Building configuration"
	@echo -e "$(WARN_COLOR)- make connect			: Connect to VM with ssh"
	@echo -e "$(WARN_COLOR)- make down			: Stopping configuration"
	@echo -e "$(WARN_COLOR)- make ps			: View configuration"
	@echo -e "$(WARN_COLOR)- make path			: Change path to vagrantboxes"
	@echo -e "$(WARN_COLOR)- make re			: Restart configuration"
	@echo -e "$(WARN_COLOR)- make clean			: Destroy configuration"
	@echo -e "$(WARN_COLOR)- make  fclean			: Forced destroy all$(NO_COLOR)"

build:
	@printf "$(OK_COLOR)==== Building configuration ${name}... ====$(NO_COLOR)\n"
	@bash start.sh
	@vagrant box add bento/debian-11 debian

connect:
	@printf "$(OK_COLOR)==== Connecting to virtual machine ${name}... ====$(NO_COLOR)\n"
	@ssh vagrant@192.168.58.102

down:
	@printf "$(ERROR_COLOR)==== Stopping configuration ${name}... ====$(NO_COLOR)\n"
	@vagrant halt

re:	down
	@printf "$(OK_COLOR)==== Restart configuration ${name}... ====$(NO_COLOR)\n"
	@vagrant up --provider=virtualbox

ps:
	@printf "$(BLUE)==== View configuration ${name}... ====$(NO_COLOR)\n"
	@vagrant status

path:
	@printf "$(YELLOW)==== Change path for ${name}... ====$(NO_COLOR)\n"
	@export VAGRANT_HOME=".vagrantboxes"
	@mkdir .vagrantboxes
	@printf "$(OK_COLOR)==== Pas has been changing ====$(NO_COLOR)\n"

clean: down
	@printf "$(ERROR_COLOR)==== Destroy configuration ${name}... ====$(NO_COLOR)\n"
	@vagrant destroy

fclean:
	@printf "$(ERROR_COLOR)==== Force destroy configurations ====$(NO_COLOR)\n"
	@vagrant destroy --force

.PHONY	: all help build down re ps clean fclean