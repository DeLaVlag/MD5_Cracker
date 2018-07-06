// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xmd5_hasher.h"

extern XMd5_hasher_Config XMd5_hasher_ConfigTable[];

XMd5_hasher_Config *XMd5_hasher_LookupConfig(u16 DeviceId) {
	XMd5_hasher_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMD5_HASHER_NUM_INSTANCES; Index++) {
		if (XMd5_hasher_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMd5_hasher_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMd5_hasher_Initialize(XMd5_hasher *InstancePtr, u16 DeviceId) {
	XMd5_hasher_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMd5_hasher_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMd5_hasher_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

