
#include "Def.h"
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
#ifdef NIUSB3_CORE_EXPORTS
#define NIUSB3_CORE_API extern "C" __declspec(dllexport)
#else
#define NIUSB3_CORE_API extern "C" __declspec(dllimport)
#endif
#else
#define NIUSB3_CORE_API
#endif


NIUSB3_CORE_API int fnniusb3_core(void);
NIUSB3_CORE_API int NI_USB3_ListDevices(char *ListOfDevice, char *model,  int *Count);
NIUSB3_CORE_API int NI_USB3_ConnectDevice(char *serial_number, NI_HANDLE *handle);
NIUSB3_CORE_API int NI_USB3_CloseConnection(NI_HANDLE *handle);
NIUSB3_CORE_API int NI_USB3_Init();

NIUSB3_CORE_API int NI_USB3_WriteData(uint32_t *data, uint32_t count, 
										uint32_t address, USB_BUS_MODE bus_mode, 
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *written_data);
NIUSB3_CORE_API int NI_USB3_ReadData(uint32_t *data, uint32_t count, 
										uint32_t address, USB_BUS_MODE bus_mode, 
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *read_data, uint32_t *valid_data);
NIUSB3_CORE_API int NI_USB3_WriteReg(uint32_t data, uint32_t address, NI_HANDLE *handle);
NIUSB3_CORE_API int NI_USB3_ReadReg(uint32_t *data, uint32_t address, NI_HANDLE *handle);
NIUSB3_CORE_API int NI_USB3_SetOffset(boolean top, uint32_t DACCODE, NI_HANDLE *handle);
NIUSB3_CORE_API int NI_USB3_SetImpedance(boolean R50, NI_HANDLE *handle);
NIUSB3_CORE_API int NI_USB3_SetIICControllerBaseAddress(uint32_t ControlAddress, uint32_t StatusAddress, NI_HANDLE *handle);


NIUSB3_CORE_API int NI_USB3_SetHV(bool Enable, float voltage, NI_HANDLE *handle);
NIUSB3_CORE_API int NI_USB3_GetHV(bool *Enable, float *voltage, float *current, NI_HANDLE *handle);
NIUSB3_CORE_API int NI_USB3_SetOffset(bool top, uint32_t DACCODE, NI_HANDLE *handle);
NIUSB3_CORE_API int NI_USB3_SetImpedance(bool R50, NI_HANDLE *handle);

NIUSB3_CORE_API int NI_USB3_IICUser_OpenController(uint32_t ControlAddress, uint32_t StatusAddress, NI_HANDLE *handle, NI_IIC_HANDLE *IIC_Handle);
NIUSB3_CORE_API int NI_USB3_IICUser_ReadData(uint8_t address, uint8_t *value, int len, uint8_t *value_read, int len_read, NI_IIC_HANDLE *IIC_Handle);
NIUSB3_CORE_API int NI_USB3_IICUser_WriteData(uint8_t address, uint8_t *value, int len, NI_IIC_HANDLE *IIC_Handle);

NIUSB3_CORE_API int NI_USB3_GetDT5550WTempSens(int address, float *temp, NI_HANDLE *handle);
NIUSB3_CORE_API char *ReadFirmwareInformationApp(	NI_HANDLE *handle);

NIUSB3_CORE_API int SECReadUIDSN(uint64_t *UID, uint32_t *SN, NI_HANDLE *handle);

NIUSB3_CORE_API int NI_USB3_GetDT5550_DGBoardInfo(char *model, int *asic_count, int *SN, NI_HANDLE *handle);


uint32_t __IICBASEADDRESS;
uint32_t __IICBASEADDRESS_STATUS;