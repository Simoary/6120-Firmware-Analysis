import argparse
import re
import subprocess
from capstone import Cs, CS_ARCH_MIPS, CS_MODE_MIPS32
from capstone import Cs, CS_ARCH_ARM, CS_MODE_ARM
from tabulate import tabulate

def find_file_system_addresses(firmware_file):
    cpio_addresses = []
    squashfs_addresses = []

    with open(firmware_file, 'rb') as file:
        firmware_data = file.read()

        cpio_magic = b'\x71\xc7\x73\xc3'
        squashfs_magic = b'sqsh'

        for match in re.finditer(cpio_magic, firmware_data):
            cpio_start = match.start()
            cpio_addresses.append(hex(cpio_start))

        for match in re.finditer(squashfs_magic, firmware_data):
            squashfs_start = match.start()
            squashfs_addresses.append(hex(squashfs_start))

    return cpio_addresses, squashfs_addresses

def get_endianness(firmware_file):
    big_endian_architectures = [b'MIPS', b'PPC', b'SPARC']
    little_endian_architectures = [b'x86', b'ARM']

    with open(firmware_file, 'rb') as file:
        firmware_data = file.read()

        for arch in big_endian_architectures:
            if arch in firmware_data:
                return "Big Endian"

        for arch in little_endian_architectures:
            if arch in firmware_data:
                return "Little Endian"

    return "Unknown"

def get_entropy(firmware_file):
    cmd = f'binwalk --entropy {firmware_file}'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    entropy = None

    match = re.search(r'Entropy: (\d+\.\d+)', result.stdout)
    if match:
        entropy = match.group(1)

    return entropy

def get_first_4_bytes_xxd(firmware_file):
    cmd = f'xxd -l 4 {firmware_file}'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return result.stdout

def identify_architecture(binary_file):
    with open(binary_file, 'rb') as file:
        elf_header = file.read(52)
        if elf_header[4] == 1:
            architecture = "32-bit"
        elif elf_header[4] == 2:
            architecture = "64-bit"
        else:
            architecture = "Unknown"

        return architecture

def identify_architecture_variant(binary_file):
    with open(binary_file, 'rb') as file:
        code = file.read(16)
        md = Cs(CS_ARCH_ARM, CS_MODE_ARM)
        architecture_variant = "Unknown"

        for instruction in md.disasm(code, 0):
            if instruction.mnemonic in ("mov", "ldr", "str", "add", "sub"):
                architecture_variant = "ARM"
                break

        return architecture_variant

def main():
    parser = argparse.ArgumentParser(description='Analyze router firmware file')
    parser.add_argument('firmware_file', help='Path to the firmware file')

    args = parser.parse_args()

    cpio_addresses, squashfs_addresses = find_file_system_addresses(args.firmware_file)
    endianness = get_endianness(args.firmware_file)
    entropy = get_entropy(args.firmware_file)
    first_4_bytes_xxd = get_first_4_bytes_xxd(args.firmware_file)
    architecture = identify_architecture(args.firmware_file)
    architecture_variant = "N/A"

    if architecture == "32-bit":
        architecture_variant = identify_architecture_variant(args.firmware_file)

    output = []

    output.append(["Parameter", "Value"])
    output.append(["CPIO Root Folder Addresses", ', '.join(cpio_addresses) if cpio_addresses else "NA"])
    output.append(["SquashFS Root Folder Addresses", ', '.join(squashfs_addresses) if squashfs_addresses else "NA"])
    output.append(["Firmware Endianness", endianness])
    output.append(["Entropy", entropy if entropy is not None else 'NA'])
    output.append(["First 4 bytes (xxd)", first_4_bytes_xxd])
    output.append(["Firmware Architecture", architecture])
    output.append(["Architecture Variant", architecture_variant])

    table = tabulate(output, headers="firstrow", tablefmt="grid")
    print(table)

if __name__ == '__main__':
    main()

