/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLXvtcyd.aml, Tue Sep 19 08:00:19 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000040F (1039)
 *     Revision         0x02
 *     Checksum         0x76
 *     OEM ID           "DELL"
 *     OEM Table ID     "V-5401"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "DELL", "V-5401", 0x00000000)
{
    External (_SB_.AC__, DeviceObj)
    External (_SB_.ACOS, IntObj)
    External (_SB_.ACSE, IntObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.I2C1, DeviceObj)
    External (_SB_.PCI0.I2C1.TPD0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (_SB_.PCI0.ZPRW, MethodObj)    // 0 Arguments
    External (_SB_.PR00, ProcessorObj)
    External (HPTE, IntObj)
    External (STAS, IntObj)
    External (TPDM, FieldUnitObj)
    External (XPRW, MethodObj)    // 2 Arguments

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            STAS = One
            TPDM = Zero
            HPTE = Zero
            \_SB.ACOS = 0x80
            \_SB.ACSE = Zero
        }

        Scope (_SB)
        {
            Device (USBX)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x04)
                    {
                        "kUSBSleepPortCurrentLimit", 
                        0x0BB8, 
                        "kUSBWakePortCurrentLimit", 
                        0x0BB8
                    })
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }

            Scope (AC)
            {
                If (_OSI ("Darwin"))
                {
                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x6F, 
                        0x03
                    })
                }
            }

            Scope (PR00)
            {
                If (_OSI ("Darwin"))
                {
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x02)
                        {
                            "plugin-type", 
                            One
                        })
                    }
                }
            }

            Scope (PCI0)
            {
                Method (UPRW, 0, NotSerialized)
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Package (0x02)
                        {
                            0x6D, 
                            Zero
                        })
                    }

                    Return (\_SB.PCI0.ZPRW ())
                }

                Device (MCHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                Scope (I2C1)
                {
                    Scope (TPD0)
                    {
                        If (_OSI ("Darwin"))
                        {
                            Name (OSYS, 0x07DC)
                        }
                    }
                }

                Scope (GFX0)
                {
                    Device (PNLF)
                    {
                        Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
                        Name (_CID, "backlight")  // _CID: Compatible ID
                        Name (_UID, 0x13)  // _UID: Unique ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0B)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }
                }

                Scope (LPCB)
                {
                    Device (PMCR)
                    {
                        Name (_HID, EisaId ("APP9876"))  // _HID: Hardware ID
                        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                        {
                            Memory32Fixed (ReadWrite,
                                0xFE000000,         // Address Base
                                0x00010000,         // Address Length
                                )
                        })
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0B)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Device (EC)
                    {
                        Name (_HID, "ACID0001")  // _HID: Hardware ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Scope (PS2K)
                    {
                        If (_OSI ("Darwin"))
                        {
                            Name (RMCF, Package (0x04)
                            {
                                "Keyboard", 
                                Package (0x02)
                                {
                                    "RemapPrntScr", 
                                    ">y"
                                }, 

                                "Keyboard", 
                                Package (0x02)
                                {
                                    "Custom PS2 Map", 
                                    Package (0x03)
                                    {
                                        Package (0x00){}, 
                                        "46=0", 
                                        "e045=0"
                                    }
                                }
                            })
                        }
                    }
                }
            }
        }

        Method (GPRW, 2, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((0x6D == Arg0))
                {
                    Return (Package (0x02)
                    {
                        0x6D, 
                        Zero
                    })
                }

                If ((0x0D == Arg0))
                {
                    Return (Package (0x02)
                    {
                        0x0D, 
                        Zero
                    })
                }

                If ((0x69 == Arg0))
                {
                    Return (Package (0x02)
                    {
                        0x69, 
                        Zero
                    })
                }
            }

            Return (XPRW (Arg0, Arg1))
        }
    }
}

