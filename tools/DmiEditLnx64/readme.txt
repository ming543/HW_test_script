Overview
-------------------------------------------------------------------------------
AMIDELNX (DMIEdit) is a Desktop Management Interface utility with command line
interface. It allows you to modify strings associated with SMBIOS tables on
AMIBIOS host system.

Features
-------------------------------------------------------------------------------
The utility offers you to modify following SMBIOS table:

 * BIOS Information (Type 0)
 * System (Type 1)
 * Base Board (Type 2)
 * Chassis (Type 3)
 * Processor Information (Type 4)
 * OEM String (Type 11)
 * System Configuration Options (Type 12)
 * Portable Battery (Type 22)
 * System Power Supply (Type 39)

Requirements
-------------------------------------------------------------------------------
Supported Operating System
  AMIDELNX Utility is supported only in following operating system:
   * Linux environment

BIOS Requirements
  System BIOS should have the followings:
   * SMM eModule with ¡§5.004_SmmCore_00¡¨ label or later.
   * SMBIOS eModule with ¡§5.004_SmBios_00¡¨ label or later.
   * Aptio 5 and later.

Operating System Driver Requirements
  Read 'DRIVER' section for details of building the driver.

Getting Started
-------------------------------------------------------------------------------
Installation
  Copies the AMIDELNX file to any storage location accessible by the host 
system. And then type './amidelnx_26_32' or './amidelnx_26_64' to see a list 
of available commands and update SMBIOS strings anyway your want.     

Usage
  AMIDELNX <Configuration File Name>
   Or
  AMIDELNX <Command 1>
   Or
  AMIDELNX [Option 1] [Option 2]¡K..

  Configuration File Name
   The input file includes at least one SMBIOS Table entry. Each SMBIOS table
   entry contains the SMBIOS table type name followed by the strings to be
   edited. User can use a text editor Or use "/DMS" command to create an
   example file. Default file name is "CONFIG.DMS". Following lists the example
   of SMBIOS configuration file:

    [BIOS]
    Version = 4.6.4
    Date = 10/29/2010

    [System]
    Manufacturer = To be filled by O.E.M.
    Product = To be filled by O.E.M.
    Version = To be filled by O.E.M.
    SerialNum = To be filled by O.E.M.
    UUID = 00020003000400050006000700080009
    SKUNum = To be filled by O.E.M.
    Family = To be filled by O.E.M.

    [BaseBoard]
    Manufacturer = AMD Corporation
    Product = Tilapia CRB
    Version = To be filled by O.E.M.
    SerialNum = To be filled by O.E.M.
    AssetTag = To be filled by O.E.M.

    [Chassis]
    Manufacturer = To Be Filled By O.E.M.
    ChassisType = 03
    Version = To Be Filled By O.E.M.
    SerialNum = To Be Filled By O.E.M.
    TagNum = To Be Filled By O.E.M.
    ChassisOEM = 00000000

    [OemString]
    String = To Be Filled By O.E.M.

    [Configuration]
    String = To Be Filled By O.E.M.

  Commands
   * /ALL [Output File Name] Output information to screen Or file.
   * /DMS [Output File Name] Create configuration file. Default file name is
                             "CONFIG.DMS".
   * /DUMP # [#] [#] Read Type # data.
   * /DUMPALL [FileName] Output all SMBIOS data to screen Or file.

  Options
   User can order following commands to select the operation mode for
   read/write strings associated with SMBIOS tables, create configuration file
   ...etc. The valid commands and related format as below:

   Part 0. System (Type 0)
    * /IVN ["String"]    Read/Write BIOS vendor name.
    * /IV  ["String"]    Read/Write BIOS Version.
    * /ID  ["String"]    Read/Write BIOS release date.

   Part 1. System (Type 1)
    * /SM  ["String"]    Read/Write system manufacturer.
    * /SP  ["String"]    Read/Write system product.
    * /SV  ["String"]    Read/Write system version.
    * /SS  ["String"]    Read/Write system serial number.
    * /SU  [16 Bytes]    Read/Write system UUID.
    * /SU  AUTO          Generates system UUID automatically and update Type 1.
    * /SK  ["String"]    Read/Write system SKU number.
    * /SF  ["String"]    Read/Write system family name.

   Part 2-1. Base Board (Type 2)
    * /BM  ["String"]    Read/Write baseboard manufacturer.
    * /BP  ["String"]    Read/Write baseboard product.
    * /BV  ["String"]    Read/Write baseboard version.
    * /BS  ["String"]    Read/Write baseboard serial number.
    * /BT  ["String"]    Read/Write Asset Tag
    * /BLC ["String"]    Read/Write Location in Chassis

   Part 2-2. Base Board (Type 2)
    * /BMH  <handle #> ["String"]    Read/Write baseboard manufacturer.
    * /BPH  <handle #> ["String"]    Read/Write baseboard product.
    * /BVH  <handle #> ["String"]    Read/Write baseboard version.
    * /BSH  <handle #> ["String"]    Read/Write baseboard serial number.
    * /BTH  <handle #> ["String"]    Read/Write Asset Tag
    * /BLCH <handle #> ["String"]    Read/Write Location in Chassis
    
   Part 3-1. Chassis (Type 3)
    * /CM  ["String"]      Read/Write chassis manufacturer.
    * /CT  [8-Bits value]  Read/Write chassis type.
    * /CV  ["String"]      Read/Write chassis version.
    * /CS  ["String"]      Read/Write chassis serial number.
    * /CA  ["String"]      Read/Write chassis tag.
    * /CO  [32-Bits value] Read/Write chassis OEM-defined value
    * /CSK ["String"] 	   Read/Write chassis SKU Number

   Part 3-2. Chassis (Type 3)
    * /CMH  <handle #> ["String"]      Read/Write chassis manufacturer.
    * /CTH  <handle #> [8-Bits value]  Read/Write chassis type.
    * /CVH  <handle #> ["String"]      Read/Write chassis version.
    * /CSH  <handle #> ["String"]      Read/Write chassis serial number.
    * /CAH  <handle #> ["String"]      Read/Write chassis tag.
    * /COH  <handle #> [32-Bits value] Read/Write chassis OEM-defined value
    * /CSKH <handle #> ["String"]      Read/Write chassis SKU Number

   Part 4. Processor Information (Type 4)
    * /PSN  ["String"]      Read/Write Processor serial number.
    * /PAT  ["String"]      Read/Write Processor asset tag.
    * /PPN  ["String"]      Read/Write Processor part number.

   Part 5. OEM String (Type 11)
    * /OS  [<Number> <"String">]  Read/Write #th OEM string.

   Part 6. OEM String (Type 12)
    * /SCO [<Number> <"String">] Read/Write #th Sys. Configuration Op. string.

   Part 7. Portable Battery (Type 22)
    * /PBL  <handle #> ["String"]      Read/Write Portable Battery Location.
    * /PBM  <handle #> ["String"]      Read/Write Portable Battery Manufacturer.
    * /PBD  <handle #> ["String"]      Read/Write Portable Battery Manufacturer Date.
    * /PBS  <handle #> ["String"]      Read/Write Portable Battery Serial Number.
    * /PBN  <handle #> ["String"]      Read/Write Portable Battery Device Name.
    * /PBCH <handle #> [8-Bits value]      Read/Write Portable Battery Device Chemistry.
    * /PBCA <handle #> [16-Bits value]      Read/Write Portable Battery Design Capacity.
    * /PBV  <handle #> [16-Bits value]      Read/Write Portable Battery Design Voltage.
    * /PBSV <handle #> ["String"]      Read/Write Portable Battery SBDS Version Number.
    * /PBE  <handle #> [8-Bits value]      Read/Write Portable Battery Maxmum Error.
    * /PBSN <handle #> [16-Bits value]      Read/Write Portable Battery SBDS Serial Number.
    * /PBSD <handle #> [16-Bits value]      Read/Write Portable Battery SBDS Manufacturer Date.
    * /PBSC <handle #> ["String"]      Read/Write Portable Battery SBDS Device Chemistry.
    * /PBCM <handle #> [8-Bits value]      Read/Write Portable Battery Design Capacity Multiplier.
    * /PBO  <handle #> [32-Bits value]      Read/Write Portable Battery OEM-Specific.

   Part 8. Power supply (Type 39)
    * /PU <handle #> [8-Bits value]   Read/Write Power supply unit group.
    * /PL <handle #> ["String"] Read/Write Power supply location.
    * /PD <handle #> ["String"] Read/Write Power supply device name.
    * /PM <handle #> ["String"] Read/Write Power supply manufacturer.
    * /PS <handle #> ["String"] Read/Write Power supply serial number.
    * /PT <handle #> ["String"] Read/Write Power supply asset tag number.
    * /PN <handle #> ["String"] Read/Write Power supply model part number.
    * /PR <handle #> ["String"] Read/Write Power supply revision level.
    * /PP <handle #> [16-Bits value]   Read/Write Power supply max power capacity.
    * /PC <handle #> [16-Bits value]   Read/Write Power supply characteristics.
    * /PVH <handle #> [16-Bits value]  Read/Write Power supply voltage probe handle.
    * /PDH <handle #> [16-Bits value]  Read/Write Power supply cooling dev. handle.
    * /PCH <handle #> [16-Bits value]  Read/Write Power supply current probe handle.

  Parameters List
   Name                Description
   ----------------------------------------------------------------------------
   String              NULL-Terminated ASCII string.
   8-Bits value        This parameter MUST be 2-digits hexadecimal value.
   32-Bits value       This parameter MUST be 8-digits hexadecimal value.
   16 Bytes            This parameter MUST be 32-digits hexadecimal value.
   Number              The decimal value ranges between 1 and 127.
   Output File Name    This parameter is used to specify path/filename of the
                       output file with extension.

  Rules
   * Any parameter encolsed by < > is a mandatory field.
   * Any parameter enclosed by [ ] is an optional field.
   * For command part 1-7, if parameter present, the WRITE function is going to
     update else READ function will be enabled.
   * For command </ALL>, if Output File Name present, the SMBIOS information
     will be saved intothe file else it will be displayed on screen.
   * Using </DMS> without parameter can get ¡§CONFIG.DMS¡¨ file in same
     directory, otherwise, the user-defined output file will contain the
     example syntax.
   * Using </OS> without any parameter will display all OEM string on screen.
   * The format of BIOS release date is "mm/dd/yyyy".

DRIVER
-------------------------------------------------------------------------------
1. Log in Linux as root.

2. The compiler suite(gcc) must be installed. If these packages are not
    installed, the driver CANNOT be built.

3. For most distributions, AMIDELNX will generate Driver file
   automatically without notification. Certainly, the driver file may NOT be
   generted in some specific case and the loading driver failure message
   will be displayed. If you get this error, first, you can read 'Q1' and 'Q2'
   in 'TROUBLESHOOTING section' to shut out the kernel issues, and second, 
   you can see Point.4 below to create driver file by yourself and launch 
   AMIDELNX again. 
	     
4. Kernel sources must be installed, *CONFIGURED*, and then compiled.
   Following are steps to do this:

   4.1 Find Running Kernel's Configuration File:
       To configure the sources, simply change to the kernel source directory
       (typically /lib/modules/$(uname -r)/build). If it doesn't exist, 
       you need to install kernel source. Typically, the reference configuration 
       for the kernel can be found in the /boot directory with filename 
       '.config', 'kernel.config', or 'vmlinux-2.4.18-3.config'. Type 'uname -a' 
       and use the configuration filename that best matches the output from 
       'uname -a'.

       On some distributions Red Hat for instance, there is a config
       directory under /lib/modules/$(uname -r)/build.

       Copy this configuration file into the root of the linux kernel source
       tree(usually it is /lib/modules/$(uname -r)/build). 
       This file must be renamed to ".config"(dot config).


   4.2 Make Your Driver(amifldrv_mod.o):
       For most distribution, the command to build the driver is:
           amidelnx_26_32 /MAKEDRV
       or
           amidelnx_26_64 /MAKEDRV

	 If your linux's kernel source tree is under /lib/modules/$(uname -r)/build 
       instead of the default path '/lib/modules/$(uname -r)/build', 
       add a KERNEL flag:
           amidelnx_26_32 /MAKEDRV KERNEL=/lib/modules/$(uname -r)/build
       or
           amidelnx_26_64 /MAKEDRV KERNEL=/lib/modules/$(uname -r)/build
    
       If KERNEL is omitted, the default is /lib/modules/$(uname -r)/build.  
       This should work for MOST distributions.

   4.3 Make Your AMI Flash Driver from dirver source files (amifldrv_mod.o):
       Using command /GENDRV, it will generate driver source files to specific directory.
           amidelnx_26_32 /GENDRV [Option 1] [Option 2]
       or
           amidelnx_26_64 /GENDRV [Option 1] [Option 2]

       [Option 1]: Specific kernel source 'KERNEL=XXXX' same as the /MAKEDRV
       [Option 2]: Specific output directory 'OUTPUT=XXXX'

	   Generate files as below:

       File Name           Description
       ---------------------------------------------------------------------------
       amiwrap.c           Driver source code.
       amiwrap.h           Driver header.
       amifldrv.o_shipped  Object file for driver. kernel version 2.6
                           (For kernel version 2.4 object file is amifldrv.o )
       Makefile            Makefile
       ---------------------------------------------------------------------------

       For most distribution, the command to build the driver is:
           make
       If your linux's kernel source tree is under /lib/modules/$(uname -r)/build 
       instead of the default path '/lib/modules/$(uname -r)/build', 
       add a KERNEL flag:
           make KERNEL=/lib/modules/$(uname -r)/build
      
       If KERNEL is omitted, the default is /lib/modules/$(uname -r)/build.  
       This should work for MOST distributions.

   4.4 Check Your Build:
       Check the version of running Linux kernel with 'uname -r'.
       Check the version of amifldrv_mod.o with 'modinfo amifdrv_mod.o'.

       If they mismatch, you will need to select the correct configuration
       file(.config), rebuild your kernel, and then rebuild your driver as
       described in (4.1), (4.2), (4.3). and (4.4).
       
       The amifdrv_mod.o must be in same directory with amidelnx_26_32(amidelnx_26_64).
       If they match, continue on to the 'AMIDELNX' section to run amidelnx.


TROUBLESHOOTING
-------------------------------------------------------------------------------
Q1: I get following error message when loading driver:
    "insmod: error inserting 'amifldrv_mod.o': -1 Invalid module format".
A1: Most likely this is cause by wrong configuration file and your kernel
    refuses to accept your driver because version strings(more precisely,
    version magic) do not match.

    To check the version of running Linux kernel, type "uname -r".
    To check the version of amifldrv_mod.o, type "modinfo amifldrv_mod.o"

    If they mismatch, you will need to select the correct configuration
    file(.config), rebuild your kernel, and then rebuild your driver as
    described in section 3.

Q2: When I run amidelnx_26_32(amidelnx_26_64), it says "Unable to load driver".
A2: Some Linux distributions do not display driver debug messages on screen
    by default. Type "dmesg" to see those debug messages. This is very likely
    the same problem as Q1.

Q3: When I run amidelnx_26_32(amidelnx_26_64), 
    it simply freezes or abnormal conditions occurred on SMBIOS updating or displaying.
A3: This is caused by a Linux feature called "NMI Watchdog" which is used to
    debug Linux kernel. This feature must be disabled to run AMIDELNX.
    Please do "cat /proc/interrupts" twice and check if NMI is counting.
    If it is, then boot Linux with a kernel parameter "nmi_watchdog=N"
    where N is either 0, 1 or 2. Find out which configuration can halt NMI
    from counting by "cat /proc/interrupts" This is the configuration we
    should use to run AMIDELNX.

Q4: Do AMI Utilities support XEN?
A4: Yes. AMIDELNX v1.34 or later has supported XEN, but BIOS must to add 
    the "RuntimeMemoryHole" Module.

    For any further information please see release note for detail.


REFERENCES
-------------------------------------------------------------------------------
Linux Loadable Kernel Module HOWTO
    http://www.linux.org/docs/ldp/howto/Module-HOWTO/index.html
    
<eof>
