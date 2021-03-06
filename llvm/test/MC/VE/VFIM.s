# RUN: llvm-mc -triple=ve --show-encoding < %s \
# RUN:     | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
# RUN: llvm-mc -triple=ve -filetype=obj < %s | llvm-objdump -d - \
# RUN:     | FileCheck %s --check-prefixes=CHECK-INST

# CHECK-INST: vfim.d %v11, %v22, 12
# CHECK-ENCODING: encoding: [0x00,0x00,0x16,0x0b,0x00,0x0c,0x00,0xcf]
vfim.d %v11, %v22, 12

# CHECK-INST: vfim.d %vix, %vix, %s23
# CHECK-ENCODING: encoding: [0x00,0x00,0xff,0xff,0x00,0x97,0x00,0xcf]
vfim.d %vix, %vix, %s23

# CHECK-INST: vfim.s %v11, %vix, 63
# CHECK-ENCODING: encoding: [0x00,0x00,0xff,0x0b,0x00,0x3f,0x80,0xcf]
vfim.s %v11, %vix, 63

# CHECK-INST: vfim.s %vix, %v20, -64
# CHECK-ENCODING: encoding: [0x00,0x00,0x14,0xff,0x00,0x40,0x80,0xcf]
vfim.s %vix, %v20, -64
