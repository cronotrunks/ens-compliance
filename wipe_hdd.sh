#!/bin/bash

# --- Color and Style Configuration ---
BOLD=$(tput bold)
RESET=$(tput sgr0)
RED="${BOLD}\033[38;5;196m"
YELLOW="${BOLD}\033[38;5;220m"
GREEN="${BOLD}\033[38;5;46m"
BLUE="${BOLD}\033[38;5;39m"
CYAN="${BOLD}\033[38;5;51m"
MAGENTA="${BOLD}\033[38;5;201m"
DIM="\033[38;5;240m"
ORANGE="${BOLD}\033[38;5;208m"

# --- Messaging Functions ---
print_warning() {
  echo -e "${YELLOW}⚠ [WARNING]${RESET} ${1}"
}

print_error() {
  echo -e "${RED}✖ [ERROR]${RESET} ${1}"
}

print_success() {
  echo -e "${GREEN}✔ [SUCCESS]${RESET} ${1}"
}

print_info() {
  echo -e "${BLUE}ℹ [INFO]${RESET} ${1}"
}

# --- Configuration ---
BLOCK_SIZE="4M"
ITERATIONS="3"

# --- Script Logic ---
DEVICE="$1"

# --- Input Validation ---
if [ -z "$DEVICE" ]; then
  print_warning "Usage: $0 <device_path>"
  print_info "Example: $0 /dev/sdX (whole disk)"
  print_info "Example: $0 /dev/sdXY (partition, e.g., /dev/sdb1)"
  exit 1
fi

# Validate the device
if [ ! -b "$DEVICE" ]; then
  print_error "'$DEVICE' is not a valid block device."
  exit 1
fi

# --- Confirmation Prompt ---
echo -e "${RED}${BOLD}💣💣💣  DANGER ZONE  💣💣💣${RESET}"
echo -e "${RED}${BOLD}You are about to ERASE ALL DATA on ${DEVICE}!${RESET}"
echo ""
print_warning "This will overwrite the entire device with random data."
print_warning "ALL DATA ON THIS DEVICE WILL BE LOST IRRECOVERABLY."
echo ""

read -p "👉 Type '${BOLD}YES${RESET}' to confirm and continue: " confirm_input

if [ "$confirm_input" != "YES" ]; then
  print_info "Operation cancelled by user. No changes were made."
  exit 0
fi

# --- Execution ---
print_info "Starting secure wipe on ${DEVICE} using block size: ${BLOCK_SIZE}"
print_info "This may take a while depending on device speed and size."

for i in $(seq 1 $ITERATIONS); do
  echo -e "${CYAN}🔁 Iteration $i/$ITERATIONS:${RESET}"
  echo sudo dd if=/dev/urandom of="$DEVICE" bs="$BLOCK_SIZE" status=progress || {
    print_error "dd command failed on iteration $i. Aborting."
    exit 1
  }
done

# Clear partition table and filesystem signatures
print_info "Clearing partition table and filesystem signatures..."
echo sudo wipefs -af "$DEVICE" || {
  print_warning "wipefs failed. You may need to manually clear partition signatures."
}

# Sync writes to disk
print_info "Syncing data to disk..."
echo sudo sync

# Completion Message
echo ""
print_success "Wipe complete for ${DEVICE}!"
print_info "Device now contains only random data with no recognizable filesystem or partition table."
print_info "You may now re-partition and format it before reuse. 💾"

