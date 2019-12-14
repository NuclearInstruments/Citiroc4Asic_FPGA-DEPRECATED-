#include "niusb3_core.h"
#include  <stdlib.h>
#include <stdint.h>
#include  <stdbool.h>

#include "RegisterFile.h"

#include  "circular_buffer.h"



#include  "NEWCitirocDesignforDT0WReadoutsoftware_lib.h"

SCILIB int USB3_Init()
{
	return NI_USB3_Init();
}

SCILIB int USB3_ConnectDevice( char *IPAddress_or_SN, NI_HANDLE *handle)
{
	return NI_USB3_ConnectDevice( IPAddress_or_SN, handle);
}

SCILIB int USB3_CloseConnection(NI_HANDLE *handle)
{
	return NI_USB3_CloseConnection(handle);
}

SCILIB int USB3_ListDevices(char *ListOfDevice, char *model,  int *Count)
{
	return NI_USB3_ListDevices(ListOfDevice, model, Count);
}

SCILIB int __abstracted_mem_write(uint32_t *data, uint32_t count, 
										uint32_t address, 
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *written_data)
{
	return NI_USB3_WriteData(data,  count,  address, REG_ACCESS, timeout_ms, handle, written_data);
}


SCILIB int __abstracted_mem_read(uint32_t *data, uint32_t count, 
										uint32_t address, 
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *read_data, uint32_t *valid_data)
{
	return NI_USB3_ReadData(data,  count, address,  REG_ACCESS, timeout_ms, handle, read_data, valid_data);
}

SCILIB int __abstracted_fifo_write(uint32_t *data, uint32_t count, 
										uint32_t address, 
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *written_data)
{
	return NI_USB3_WriteData(data,  count,  address, STREAMING, timeout_ms, handle, written_data);
}
	
SCILIB int __abstracted_fifo_read(uint32_t *data, uint32_t count, 
										uint32_t address, 
										uint32_t address_status, 
										bool blocking,
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *read_data, uint32_t *valid_data)
{
	return NI_USB3_ReadData(data,  count, address,  STREAMING, timeout_ms, handle, read_data, valid_data);
}
	
SCILIB int __abstracted_reg_write(uint32_t data, uint32_t address, NI_HANDLE *handle)
{
	return NI_USB3_WriteReg(data, address, handle);
}

SCILIB int __abstracted_reg_read(uint32_t *data, uint32_t address, NI_HANDLE *handle)
{
	return NI_USB3_ReadReg(data,  address,  handle);
}

SCILIB int AFE_USB3_SetOffset(boolean top, uint32_t DACCODE, NI_HANDLE *handle)
{
	return NI_USB3_SetOffset( top,  DACCODE, handle);
}

SCILIB int AFE_USB3_SetImpedance(boolean R50, NI_HANDLE *handle)
{
	return NI_USB3_SetImpedance( R50, handle);
}

SCILIB int AFE_USB3_SetIICControllerBaseAddress(uint32_t ControlAddress, uint32_t StatusAddress, NI_HANDLE *handle)
{
	return NI_USB3_SetIICControllerBaseAddress( ControlAddress,  StatusAddress, handle);
}	


SCILIB int SetHV_A7585D(bool Enable, float voltage, NI_HANDLE *handle)
{
	return NI_USB3_SetHV(Enable, voltage, handle);
}

SCILIB int GetHV_A7585D(bool *Enable, float *voltage, float *current, NI_HANDLE *handle)
{
	return NI_USB3_GetHV(Enable, voltage, current, handle);
}

SCILIB int IICUser_OpenControllerInit(uint32_t ControlAddress, uint32_t StatusAddress, NI_HANDLE *handle, NI_IIC_HANDLE *IIC_Handle)
{
	return NI_USB3_IICUser_OpenController(ControlAddress, StatusAddress, handle, IIC_Handle);
}

SCILIB int IICUser_ReadData(uint8_t address, uint8_t *value, int len, uint8_t *value_read, int len_read, NI_IIC_HANDLE *IIC_Handle)
{
	return NI_USB3_IICUser_ReadData(address, value, len, value_read, len_read, IIC_Handle);
}

SCILIB int IICUser_WriteData(uint8_t address, uint8_t *value, int len, NI_IIC_HANDLE *IIC_Handle)
{
	return NI_USB3_IICUser_WriteData(address, value, len, IIC_Handle);
}
 
SCILIB int GetDT5550WTempSens(int address, float *temp, NI_HANDLE *handle)
{
	return NI_USB3_GetDT5550WTempSens(address, temp, handle);
}

SCILIB char *ReadFirmwareInformation(NI_HANDLE *handle)
{
	return ReadFirmwareInformationApp(handle);
}

SCILIB int ReadSN(uint32_t *SN, NI_HANDLE *handle)
{
	uint64_t UID;
	return SECReadUIDSN(&UID, SN, handle);
}

SCILIB int GetDT5550_DGBoardInfo(char *model, int *asic_count, int *SN, NI_HANDLE *handle)
{
	return NI_USB3_GetDT5550_DGBoardInfo(model, asic_count, SN, handle);
}


uint32_t gray_to_bin(uint32_t num, int nbit)
{
	uint32_t temp = num ^ (num >> 8);
	temp ^= (temp >> 4);
	temp ^= (temp >> 2);
	temp ^= (temp >> 1);
	return temp;
}



//-----------------------------------------------------------------
//-
//-  PETIROC_ALLFIFO_FLUSH
//-
//-	 Clear all FIFOs of the PETIROCFRAME syncronous
//-  ARGUMENTS:
//- 	            buffer_handle   PARAM_OUT   void ** 
//-			Handle to the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//- 	   
//-  
//-  RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-----------------------------------------------------------------

SCILIB int PETIROC_ALLFIFO_FLUSH(NI_HANDLE *handle)
{
	__abstracted_reg_write(1, SCI_REG_ALL_FIFO_RESET, handle);
	return __abstracted_reg_write(0, SCI_REG_ALL_FIFO_RESET, handle);

}




//-----------------------------------------------------------------
//-
//-  Utility_ALLOCATE_DOWNLOAD_BUFFER
//-
//-	 This function take as input a pointer to a buffer handle (not pre-allocated void*) and fill it
//-  with the pointer to the circular buffer to store data acquired from a board FIFO that is waiting
//-  to be processed.
//-  The buffer_size specify the size of the buffer to be allocated
//-  ARGUMENTS:
//- 	            buffer_handle   PARAM_OUT   void ** 
//-			Handle to the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//- 	            buffer_size   PARAM_IN   uint32_t
//- 		size in word (32 bit) of the buffer to be allocated
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//-  RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-  EXAMPLE:
//-
//-		void *BufferDownloadHandler = NULL;
//-		Utility_ALLOCATE_DOWNLOAD_BUFFER(&BufferDownloadHandler, 1024*1024);
//-----------------------------------------------------------------

SCILIB int Utility_ALLOCATE_DOWNLOAD_BUFFER(void **buffer_handle, uint32_t buffer_size)
{
	uint32_t * buffer = malloc(buffer_size * sizeof(uint32_t));
	if (buffer == NULL) return -1;
	cbuf_handle_t cbuf = circular_buf_init(buffer, buffer_size);
	*buffer_handle = cbuf;
	return 0;
}




//-----------------------------------------------------------------
//-
//-  Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER
//-
//-	 This function take as input a pointer to a buffer handle allocated with the function 
//-  Utility_ALLOCATE_DOWNLOAD_BUFFER and fill it with the content of the array val
//-  If the buffer is full the function fails and the output parameter 
//-  The buffer_size specify the size of the buffer to be allocated enqueued_data willl
//-	 contain the number of word that has been enqueued in the buffer
//-
//-  ARGUMENTS:
//- 	            buffer_handle   PARAM_IN   void *
//-			Handle to the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//- 	            val			   PARAM_IN   uint32_t *
//-			input data vector downloaded from a FIFO from the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 
//- 	            size   			PARAM_IN   uint32_t 
//- 		number of valid word in the val vector
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//- 	            enqueued_data   PARAM_OUT   uint32_t *
//-			number of word of the val vector really enqueued in the circular buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-  RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Not all word enqueued in the buffer
//-
//-  EXAMPLE:
//-
//-		FRAME_ImageReadout_0_DOWNLOAD(&data_frame, N_Packet * (9+4), timeout_frame, &handle, &read_data_frame, &valid_data_frame);
//-		Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER(BufferDownloadHandler, data_frame, valid_data_frame, &valid_data_enqueued);
//-----------------------------------------------------------------

SCILIB int Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER(void *buffer_handle, int32_t *val, uint32_t size, uint32_t *enqueued_data)
{
	cbuf_handle_t cbuf;
	uint32_t i;
	uint32_t data_counter=0;
	cbuf = ((cbuf_handle_t)buffer_handle);
	for (i = 0; i < size; i++)
	{
		if (circular_buf_full(cbuf))
		{
			*enqueued_data = data_counter;
			return -1;
		}
		data_counter++;
		circular_buf_put(cbuf, val[i]);
	}
	*enqueued_data = data_counter;
	return 0;
}


//-----------------------------------------------------------------
//-
//-  Utility_PEAK_DATA_FORM_DOWNLOAD_BUFFER
//-
//-	 This function take as input a pointer to a buffer handle allocated with the function 
//-  Utility_ALLOCATE_DOWNLOAD_BUFFER and retrive one data from the buffer (head of the FIFO)
//-  If the buffer is rmpty function fails with -1 error
//-  The buffer_size specify the size of the buffer to be allocated enqueued_data willl
//-	 contain the number of word that has been enqueued in the buffer
//-
//-  ARGUMENTS:
//- 	            buffer_handle   PARAM_IN   void *
//-			Handle to the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//- 	            val			   PARAM_OUT   uint32_t *
//-			head of the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-  RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Empty
//-
//-  EXAMPLE:
//-----------------------------------------------------------------


SCILIB int Utility_PEAK_DATA_FORM_DOWNLOAD_BUFFER(void *buffer_handle, int32_t *val)
{
	cbuf_handle_t cbuf;
	cbuf = (cbuf_handle_t)buffer_handle;
	if (circular_buf_empty(cbuf))
		return -1;
	circular_buf_get(cbuf, val);
	return 0;
}

//-----------------------------------------------------------------
//-
//-  free_PETIROCFRAME_packet_collection
//-
//-	 This function take as input a pointer to a decoded packets and release the memory
//-
//-  ARGUMENTS:
//- 	    buffer_handle   PARAM_IN   t_ASIC_packet_collection *
//-			Packet to be released
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-  RETURN [void]
//-
//-  EXAMPLE:
//-		PETIROCFRAME_PetirocFrame0_RECONSTRUCT_DATA(BufferDownloadHandler, &decoded_packets);
//-		... processing code ...
//-		free_PETIROCFRAME_packet_collection(&decoded_packets);
//-----------------------------------------------------------------


SCILIB void free_PETIROCFRAME_packet_collection(t_ASIC_packet_collection *decoded_packets)
{
	int i;
	for (i = 0; i < decoded_packets->allocated_packets; i++)
	{
		free(decoded_packets->packets[i].Charge);
		free(decoded_packets->packets[i].FineTime);
		free(decoded_packets->packets[i].CoarseTime);
		free(decoded_packets->packets[i].Hit);
	}
	free(decoded_packets->packets);
}


//-----------------------------------------------------------------
//-
//-  free_FRAME_packet_collection
//-
//-	 This function take as input a pointer to a decoded packets and release the memory
//-
//-  ARGUMENTS:
//- 	            buffer_handle   PARAM_IN   t_FRAME_packet_collection *
//-			Packet to be released
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-  RETURN [void]
//-
//-  EXAMPLE:
//-		FRAME_ImageReadout_0_RECONSTRUCT_DATA(BufferDownloadHandler, &decoded_packets);
//-		... processing code ...
//-		free_FRAME_packet_collectionvoid(&decoded_packets);
//-----------------------------------------------------------------


SCILIB void free_FRAME_packet_collection (t_FRAME_packet_collection *decoded_packets)
{
	int i;
	for (i = 0; i < decoded_packets->allocated_packets; i++)
	{
		free(decoded_packets->packets[i].Energy);
	}
	free(decoded_packets->packets);
}SCILIB int REG_TRIG_A_SEL_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_TRIG_A_SEL, handle);
}
SCILIB int REG_TRIG_A_SEL_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_TRIG_A_SEL, handle);
}
SCILIB int REG_VET_A_EN_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_VET_A_EN, handle);
}
SCILIB int REG_VET_A_EN_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_VET_A_EN, handle);
}
SCILIB int REG_VET_B_EN_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_VET_B_EN, handle);
}
SCILIB int REG_VET_B_EN_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_VET_B_EN, handle);
}
SCILIB int REG_VET_C_EN_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_VET_C_EN, handle);
}
SCILIB int REG_VET_C_EN_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_VET_C_EN, handle);
}
SCILIB int REG_VET_D_EN_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_VET_D_EN, handle);
}
SCILIB int REG_VET_D_EN_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_VET_D_EN, handle);
}
SCILIB int REG_SW_VET_A_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_SW_VET_A, handle);
}
SCILIB int REG_SW_VET_A_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_SW_VET_A, handle);
}
SCILIB int REG_SW_VET_B_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_SW_VET_B, handle);
}
SCILIB int REG_SW_VET_B_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_SW_VET_B, handle);
}
SCILIB int REG_SW_VET_C_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_SW_VET_C, handle);
}
SCILIB int REG_SW_VET_C_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_SW_VET_C, handle);
}
SCILIB int REG_SW_VET_D_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_SW_VET_D, handle);
}
SCILIB int REG_SW_VET_D_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_SW_VET_D, handle);
}
SCILIB int REG_TRIG_GBL_SEL_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_TRIG_GBL_SEL, handle);
}
SCILIB int REG_TRIG_GBL_SEL_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_TRIG_GBL_SEL, handle);
}
SCILIB int REG_EXT_DELAY_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_EXT_DELAY, handle);
}
SCILIB int REG_EXT_DELAY_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_EXT_DELAY, handle);
}
SCILIB int REG_SW_TRIG_FREQ_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_SW_TRIG_FREQ, handle);
}
SCILIB int REG_SW_TRIG_FREQ_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_SW_TRIG_FREQ, handle);
}
SCILIB int REG_A_RATE_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_A_RATE, handle);
}
SCILIB int REG_A_RATE_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_A_RATE, handle);
}
SCILIB int REG_B_RATE_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_B_RATE, handle);
}
SCILIB int REG_B_RATE_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_B_RATE, handle);
}
SCILIB int REG_C_RATE_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_C_RATE, handle);
}
SCILIB int REG_C_RATE_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_C_RATE, handle);
}
SCILIB int REG_D_RATE_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_D_RATE, handle);
}
SCILIB int REG_D_RATE_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_D_RATE, handle);
}
SCILIB int REG_T0_COUNT_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_T0_COUNT, handle);
}
SCILIB int REG_T0_COUNT_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_T0_COUNT, handle);
}
SCILIB int REG_A_TRG_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_A_TRG, handle);
}
SCILIB int REG_A_TRG_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_A_TRG, handle);
}
SCILIB int REG_B_TRG_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_B_TRG, handle);
}
SCILIB int REG_B_TRG_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_B_TRG, handle);
}
SCILIB int REG_C_TRG_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_C_TRG, handle);
}
SCILIB int REG_C_TRG_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_C_TRG, handle);
}
SCILIB int REG_D_TRG_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_D_TRG, handle);
}
SCILIB int REG_D_TRG_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_D_TRG, handle);
}
SCILIB int REG_RUNSTART_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_RUNSTART, handle);
}
SCILIB int REG_RUNSTART_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_RUNSTART, handle);
}
SCILIB int REG_RUN_TIME_LSB_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_RUN_TIME_LSB, handle);
}
SCILIB int REG_RUN_TIME_LSB_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_RUN_TIME_LSB, handle);
}
SCILIB int REG_RUN_TIME_MSB_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_RUN_TIME_MSB, handle);
}
SCILIB int REG_RUN_TIME_MSB_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_RUN_TIME_MSB, handle);
}
SCILIB int REG_DEAD_TIME_LSB_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_DEAD_TIME_LSB, handle);
}
SCILIB int REG_DEAD_TIME_LSB_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_DEAD_TIME_LSB, handle);
}
SCILIB int REG_DEAD_TIME_MSB_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_DEAD_TIME_MSB, handle);
}
SCILIB int REG_DEAD_TIME_MSB_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_DEAD_TIME_MSB, handle);
}
SCILIB int REG_A_LOST_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_A_LOST, handle);
}
SCILIB int REG_A_LOST_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_A_LOST, handle);
}
SCILIB int REG_B_LOST_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_B_LOST, handle);
}
SCILIB int REG_B_LOST_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_B_LOST, handle);
}
SCILIB int REG_C_LOST_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_C_LOST, handle);
}
SCILIB int REG_C_LOST_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_C_LOST, handle);
}
SCILIB int REG_D_LOST_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_D_LOST, handle);
}
SCILIB int REG_D_LOST_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_D_LOST, handle);
}
SCILIB int REG_T0_SOFT_FREQ_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_T0_SOFT_FREQ, handle);
}
SCILIB int REG_T0_SOFT_FREQ_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_T0_SOFT_FREQ, handle);
}
SCILIB int REG_T0_SEL_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_T0_SEL, handle);
}
SCILIB int REG_T0_SEL_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_T0_SEL, handle);
}
SCILIB int REG_HOLD_TIME_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_HOLD_TIME, handle);
}
SCILIB int REG_HOLD_TIME_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_HOLD_TIME, handle);
}
//-----------------------------------------------------------------
//-
//- Citiroc_CitirocCfg0_CONFIG
//-
//- Configure ASIC.
//-
//- ARGUMENTS:
//- 	           incfg   PARAM_IN    int32_t
//- 		Bitstream to be downloaded to the ASIC. Use integrated SciCompiler Tool to generate the bitstream or read Citiroc documentation
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int Citiroc_CitirocCfg0_CONFIG(char *incfg, NI_HANDLE *handle)
{
int i,j;
uint32_t bitstream[1152];
uint32_t cfg[32];
int result;
if (strlen(incfg) != 1144) return -1;
for (i=0;i<1152;i++) bitstream[i] = 0;
for (i=0;i<1144;i++)
{
	bitstream[i] = (incfg[i] == '0' ? 0:1);
}
for (i=0;i<36;i++)
{
	cfg[i]=0;
	for (j=0;j<32;j++)
		cfg[i] += (bitstream[i*32+j] << j);
}
result=0;
	result+=__abstracted_reg_write(cfg[0],SCI_REG_CitirocCfg0_REG_CFG0, handle);
	result+=__abstracted_reg_write(cfg[1],SCI_REG_CitirocCfg0_REG_CFG1, handle);
	result+=__abstracted_reg_write(cfg[2],SCI_REG_CitirocCfg0_REG_CFG2, handle);
	result+=__abstracted_reg_write(cfg[3],SCI_REG_CitirocCfg0_REG_CFG3, handle);
	result+=__abstracted_reg_write(cfg[4],SCI_REG_CitirocCfg0_REG_CFG4, handle);
	result+=__abstracted_reg_write(cfg[5],SCI_REG_CitirocCfg0_REG_CFG5, handle);
	result+=__abstracted_reg_write(cfg[6],SCI_REG_CitirocCfg0_REG_CFG6, handle);
	result+=__abstracted_reg_write(cfg[7],SCI_REG_CitirocCfg0_REG_CFG7, handle);
	result+=__abstracted_reg_write(cfg[8],SCI_REG_CitirocCfg0_REG_CFG8, handle);
	result+=__abstracted_reg_write(cfg[9],SCI_REG_CitirocCfg0_REG_CFG9, handle);
	result+=__abstracted_reg_write(cfg[10],SCI_REG_CitirocCfg0_REG_CFG10, handle);
	result+=__abstracted_reg_write(cfg[11],SCI_REG_CitirocCfg0_REG_CFG11, handle);
	result+=__abstracted_reg_write(cfg[12],SCI_REG_CitirocCfg0_REG_CFG12, handle);
	result+=__abstracted_reg_write(cfg[13],SCI_REG_CitirocCfg0_REG_CFG13, handle);
	result+=__abstracted_reg_write(cfg[14],SCI_REG_CitirocCfg0_REG_CFG14, handle);
	result+=__abstracted_reg_write(cfg[15],SCI_REG_CitirocCfg0_REG_CFG15, handle);
	result+=__abstracted_reg_write(cfg[16],SCI_REG_CitirocCfg0_REG_CFG16, handle);
	result+=__abstracted_reg_write(cfg[17],SCI_REG_CitirocCfg0_REG_CFG17, handle);
	result+=__abstracted_reg_write(cfg[18],SCI_REG_CitirocCfg0_REG_CFG18, handle);
	result+=__abstracted_reg_write(cfg[19],SCI_REG_CitirocCfg0_REG_CFG19, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg0_START_REG_CFG, handle);
	result+=__abstracted_reg_write(1,SCI_REG_CitirocCfg0_START_REG_CFG, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg0_START_REG_CFG, handle);
if (result!=0) return -1; else return 0;

}
//-----------------------------------------------------------------
//-
//- Citiroc_CitirocCfg0_CONFIG_MON
//-
//- Configure ASIC Monitor probe.
//-
//- ARGUMENTS:
//- 	           incfg   PARAM_IN    int32_t
//- 		Bitstream to be downloaded to the ASIC. Use integrated SciCompiler Tool to generate the bitstream or read Citiroc documentation
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int Citiroc_CitirocCfg0_CONFIG_MON(char *incfg, NI_HANDLE *handle)
{
int i,j;
uint32_t bitstream[1024];
uint32_t cfg[32];
int result;
if (strlen(incfg) != 256) return -1;
for (i=0;i<1024;i++) bitstream[i] = 0;
for (i=0;i<256;i++)
{
	bitstream[i] = (incfg[i] == '0' ? 0:1);
}
for (i=0;i<20;i++)
{
	cfg[i]=0;
	for (j=0;j<32;j++)
		cfg[i] += (bitstream[i*32+j] << j);
}
result=0;
	result+=__abstracted_reg_write(cfg[0],SCI_REG_CitirocCfg0_REG_CFG0, handle);
	result+=__abstracted_reg_write(cfg[1],SCI_REG_CitirocCfg0_REG_CFG1, handle);
	result+=__abstracted_reg_write(cfg[2],SCI_REG_CitirocCfg0_REG_CFG2, handle);
	result+=__abstracted_reg_write(cfg[3],SCI_REG_CitirocCfg0_REG_CFG3, handle);
	result+=__abstracted_reg_write(cfg[4],SCI_REG_CitirocCfg0_REG_CFG4, handle);
	result+=__abstracted_reg_write(cfg[5],SCI_REG_CitirocCfg0_REG_CFG5, handle);
	result+=__abstracted_reg_write(cfg[6],SCI_REG_CitirocCfg0_REG_CFG6, handle);
	result+=__abstracted_reg_write(cfg[7],SCI_REG_CitirocCfg0_REG_CFG7, handle);
	result+=__abstracted_reg_write(cfg[8],SCI_REG_CitirocCfg0_REG_CFG8, handle);
	result+=__abstracted_reg_write(cfg[9],SCI_REG_CitirocCfg0_REG_CFG9, handle);
	result+=__abstracted_reg_write(cfg[10],SCI_REG_CitirocCfg0_REG_CFG10, handle);
	result+=__abstracted_reg_write(cfg[11],SCI_REG_CitirocCfg0_REG_CFG11, handle);
	result+=__abstracted_reg_write(cfg[12],SCI_REG_CitirocCfg0_REG_CFG12, handle);
	result+=__abstracted_reg_write(cfg[13],SCI_REG_CitirocCfg0_REG_CFG13, handle);
	result+=__abstracted_reg_write(cfg[14],SCI_REG_CitirocCfg0_REG_CFG14, handle);
	result+=__abstracted_reg_write(cfg[15],SCI_REG_CitirocCfg0_REG_CFG15, handle);
	result+=__abstracted_reg_write(cfg[16],SCI_REG_CitirocCfg0_REG_CFG16, handle);
	result+=__abstracted_reg_write(cfg[17],SCI_REG_CitirocCfg0_REG_CFG17, handle);
	result+=__abstracted_reg_write(cfg[18],SCI_REG_CitirocCfg0_REG_CFG18, handle);
	result+=__abstracted_reg_write(cfg[19],SCI_REG_CitirocCfg0_REG_CFG19, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg0_START_REG_CFG, handle);
	result+=__abstracted_reg_write(2,SCI_REG_CitirocCfg0_START_REG_CFG, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg0_START_REG_CFG, handle);
if (result!=0) return -1; else return 0;

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_1_START
//-
//- Start Oscilloscope acquisition.
//-
//- ARGUMENTS:
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_1_START(NI_HANDLE *handle)

{
int r1 = __abstracted_reg_write(0,SCI_REG_Oscilloscope_1_CONFIG_ARM, handle);
int r2 = __abstracted_reg_write(1,SCI_REG_Oscilloscope_1_CONFIG_ARM, handle);
if ((r1 == 0) && (r2 == 0))
    return 0;
else
    return -1;

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_1_SET_PARAMETERS
//-
//- Configure oscilloscope parameters
//-
//- ARGUMENTS:
//- 	       decimator   PARAM_IN    int32_t
//- 		Set decimator value. 0: no decimation, 1: divide by two, ...
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             pre   PARAM_IN    int32_t
//- 		Set the length in samples of pre-trigger buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	software_trigger   PARAM_IN    int32_t
//- 		Generate software trigger to force start acquisition (1:generate trigger)
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	  analog_trigger   PARAM_IN    int32_t
//- 		Enable threshold trigger on analog input of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital0_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 0 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital1_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 1 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital2_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 2 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital3_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 3 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	 trigger_channel   PARAM_IN    int32_t
//- 		Select channel of the oscilloscope connected to the trigger logic
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	    trigger_edge   PARAM_IN    int32_t
//- 		Select channel of the oscilloscope connected to the trigger logic
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Rising
//- 		1) Falling
//-
//- 	   trigger_level   PARAM_IN    int32_t
//- 		Level in LSB of the leading edge comparator on analog input. Use only with analog_trigger=1
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_1_SET_PARAMETERS(int32_t decimator, int32_t pre, int32_t software_trigger, int32_t analog_trigger, int32_t digital0_trigger, int32_t digital1_trigger, int32_t digital2_trigger, int32_t digital3_trigger, int32_t trigger_channel, int32_t trigger_edge, int32_t trigger_level, NI_HANDLE *handle)
{
int32_t triggermode = 0;
int r_decimator = __abstracted_reg_write(decimator, SCI_REG_Oscilloscope_1_CONFIG_DECIMATOR, handle);
int r_pre = __abstracted_reg_write(pre, SCI_REG_Oscilloscope_1_CONFIG_PRETRIGGER, handle);
int r_triglevel = __abstracted_reg_write(trigger_level, SCI_REG_Oscilloscope_1_CONFIG_TRIGGER_LEVEL, handle);
triggermode = (trigger_channel << 8)  + (software_trigger << 7 ) + (trigger_edge << 3) + (software_trigger << 1) + analog_trigger + (digital0_trigger << 2) + (digital1_trigger << 2) + digital1_trigger + (digital2_trigger << 2) + (digital2_trigger << 1) + (digital3_trigger << 2) + (digital3_trigger << 1) + digital3_trigger ; 
int r_triggermode = __abstracted_reg_write(triggermode, SCI_REG_Oscilloscope_1_CONFIG_TRIGGER_MODE, handle);
if (r_decimator == 0 & r_pre == 0 & r_triglevel == 0 & r_triggermode == 0)
    return 0;
else
    return -1;

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_1_STATUS
//-
//- Get Oscilloscope status
//-
//- ARGUMENTS:
//- 	          status  PARAM_OUT    int32_t
//- 		Return the oscilloscope status
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) No data available
//- 		1) Data available
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_1_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Oscilloscope_1_READ_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_1_POSITION
//-
//- Get Oscilloscope trigger position. The trigger position indicate the position in the output buffer of each channels where the sample at t0 occureed. PRE-TRIGGER samples before t0 is the pre-trigger data.
//-
//- ARGUMENTS:
//- 	        position  PARAM_OUT    int32_t
//- 		Return the trigger position in the data set in order to correct recustruct the pre-prigger and post trigger data
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_1_POSITION(int32_t *position,NI_HANDLE *handle)
{
return __abstracted_reg_read(position, SCI_REG_Oscilloscope_1_READ_POSITION, handle);

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_1_DOWNLOAD
//-
//- Download data from oscilloscope buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Oscilloscope_1POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Oscilloscope_1_DOWNLOAD(data_buffer, BUFFER_SIZE_Oscilloscope_1, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Oscilloscope_1 to get actual oscilloscope buffer size on FPGA
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_1_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Oscilloscope_1_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_1_RECONSTRUCT
//-
//- Take as input the downloaded buffer and decode the the different track for each channels. Channel order is the following: [0...1023] Channel 1, [1024...2047] Channel2
//- 
//- 
//-
//- ARGUMENTS:
//- 	        data_osc   PARAM_IN   uint32_t
//- 		uint32_t buffer containing the raw data download with the DOWNLOAD function
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	        position   PARAM_IN   uint32_t
//- 		Position of the trigger obtained with the POSITION function
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	     pre_trigger   PARAM_IN    int32_t
//- 		Length of the pre-trigger
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	     read_analog  PARAM_OUT   uint32_t
//- 		Analog track reordered in time. Data are encoded in unsigned data format between -32576 and 32576
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital0  PARAM_OUT   uint32_t
//- 		Digital track 0 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital1  PARAM_OUT   uint32_t
//- 		Digital track 1 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital2  PARAM_OUT   uint32_t
//- 		Digital track 2 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital3  PARAM_OUT   uint32_t
//- 		Digital track 3 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_1_RECONSTRUCT(uint32_t *data_osc, uint32_t position, int32_t pre_trigger, uint32_t *read_analog, uint32_t *read_digital0, uint32_t *read_digital1, uint32_t *read_digital2, uint32_t *read_digital3)
{
int n_ch = 2;
int n_samples = 1024;
for(int n=0; n< n_ch; n++)
{
	int current = position - pre_trigger;
	if (current > 0)
    {
	    int k = 0;
	    for (int i = current; i < n_samples - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
	    for (int i = 0; i < current - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
    }
    else
    {
	    int k = 0;
	    for (int i = n_samples+current; i < n_samples - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
	    for (int i = 0; i < n_samples + current - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
    }
}
return 0;

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_2_START
//-
//- Start Oscilloscope acquisition.
//-
//- ARGUMENTS:
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_2_START(NI_HANDLE *handle)

{
int r1 = __abstracted_reg_write(0,SCI_REG_Oscilloscope_2_CONFIG_ARM, handle);
int r2 = __abstracted_reg_write(1,SCI_REG_Oscilloscope_2_CONFIG_ARM, handle);
if ((r1 == 0) && (r2 == 0))
    return 0;
else
    return -1;

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_2_SET_PARAMETERS
//-
//- Configure oscilloscope parameters
//-
//- ARGUMENTS:
//- 	       decimator   PARAM_IN    int32_t
//- 		Set decimator value. 0: no decimation, 1: divide by two, ...
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             pre   PARAM_IN    int32_t
//- 		Set the length in samples of pre-trigger buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	software_trigger   PARAM_IN    int32_t
//- 		Generate software trigger to force start acquisition (1:generate trigger)
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	  analog_trigger   PARAM_IN    int32_t
//- 		Enable threshold trigger on analog input of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital0_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 0 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital1_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 1 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital2_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 2 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital3_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 3 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	 trigger_channel   PARAM_IN    int32_t
//- 		Select channel of the oscilloscope connected to the trigger logic
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	    trigger_edge   PARAM_IN    int32_t
//- 		Select channel of the oscilloscope connected to the trigger logic
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Rising
//- 		1) Falling
//-
//- 	   trigger_level   PARAM_IN    int32_t
//- 		Level in LSB of the leading edge comparator on analog input. Use only with analog_trigger=1
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_2_SET_PARAMETERS(int32_t decimator, int32_t pre, int32_t software_trigger, int32_t analog_trigger, int32_t digital0_trigger, int32_t digital1_trigger, int32_t digital2_trigger, int32_t digital3_trigger, int32_t trigger_channel, int32_t trigger_edge, int32_t trigger_level, NI_HANDLE *handle)
{
int32_t triggermode = 0;
int r_decimator = __abstracted_reg_write(decimator, SCI_REG_Oscilloscope_2_CONFIG_DECIMATOR, handle);
int r_pre = __abstracted_reg_write(pre, SCI_REG_Oscilloscope_2_CONFIG_PRETRIGGER, handle);
int r_triglevel = __abstracted_reg_write(trigger_level, SCI_REG_Oscilloscope_2_CONFIG_TRIGGER_LEVEL, handle);
triggermode = (trigger_channel << 8)  + (software_trigger << 7 ) + (trigger_edge << 3) + (software_trigger << 1) + analog_trigger + (digital0_trigger << 2) + (digital1_trigger << 2) + digital1_trigger + (digital2_trigger << 2) + (digital2_trigger << 1) + (digital3_trigger << 2) + (digital3_trigger << 1) + digital3_trigger ; 
int r_triggermode = __abstracted_reg_write(triggermode, SCI_REG_Oscilloscope_2_CONFIG_TRIGGER_MODE, handle);
if (r_decimator == 0 & r_pre == 0 & r_triglevel == 0 & r_triggermode == 0)
    return 0;
else
    return -1;

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_2_STATUS
//-
//- Get Oscilloscope status
//-
//- ARGUMENTS:
//- 	          status  PARAM_OUT    int32_t
//- 		Return the oscilloscope status
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) No data available
//- 		1) Data available
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_2_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Oscilloscope_2_READ_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_2_POSITION
//-
//- Get Oscilloscope trigger position. The trigger position indicate the position in the output buffer of each channels where the sample at t0 occureed. PRE-TRIGGER samples before t0 is the pre-trigger data.
//-
//- ARGUMENTS:
//- 	        position  PARAM_OUT    int32_t
//- 		Return the trigger position in the data set in order to correct recustruct the pre-prigger and post trigger data
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_2_POSITION(int32_t *position,NI_HANDLE *handle)
{
return __abstracted_reg_read(position, SCI_REG_Oscilloscope_2_READ_POSITION, handle);

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_2_DOWNLOAD
//-
//- Download data from oscilloscope buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Oscilloscope_2POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Oscilloscope_2_DOWNLOAD(data_buffer, BUFFER_SIZE_Oscilloscope_2, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Oscilloscope_2 to get actual oscilloscope buffer size on FPGA
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_2_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Oscilloscope_2_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_2_RECONSTRUCT
//-
//- Take as input the downloaded buffer and decode the the different track for each channels. Channel order is the following: [0...1023] Channel 1, [1024...2047] Channel2
//- 
//- 
//-
//- ARGUMENTS:
//- 	        data_osc   PARAM_IN   uint32_t
//- 		uint32_t buffer containing the raw data download with the DOWNLOAD function
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	        position   PARAM_IN   uint32_t
//- 		Position of the trigger obtained with the POSITION function
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	     pre_trigger   PARAM_IN    int32_t
//- 		Length of the pre-trigger
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	     read_analog  PARAM_OUT   uint32_t
//- 		Analog track reordered in time. Data are encoded in unsigned data format between -32576 and 32576
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital0  PARAM_OUT   uint32_t
//- 		Digital track 0 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital1  PARAM_OUT   uint32_t
//- 		Digital track 1 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital2  PARAM_OUT   uint32_t
//- 		Digital track 2 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital3  PARAM_OUT   uint32_t
//- 		Digital track 3 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_2_RECONSTRUCT(uint32_t *data_osc, uint32_t position, int32_t pre_trigger, uint32_t *read_analog, uint32_t *read_digital0, uint32_t *read_digital1, uint32_t *read_digital2, uint32_t *read_digital3)
{
int n_ch = 2;
int n_samples = 1024;
for(int n=0; n< n_ch; n++)
{
	int current = position - pre_trigger;
	if (current > 0)
    {
	    int k = 0;
	    for (int i = current; i < n_samples - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
	    for (int i = 0; i < current - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
    }
    else
    {
	    int k = 0;
	    for (int i = n_samples+current; i < n_samples - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
	    for (int i = 0; i < n_samples + current - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
    }
}
return 0;

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_3_START
//-
//- Start Oscilloscope acquisition.
//-
//- ARGUMENTS:
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_3_START(NI_HANDLE *handle)

{
int r1 = __abstracted_reg_write(0,SCI_REG_Oscilloscope_3_CONFIG_ARM, handle);
int r2 = __abstracted_reg_write(1,SCI_REG_Oscilloscope_3_CONFIG_ARM, handle);
if ((r1 == 0) && (r2 == 0))
    return 0;
else
    return -1;

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_3_SET_PARAMETERS
//-
//- Configure oscilloscope parameters
//-
//- ARGUMENTS:
//- 	       decimator   PARAM_IN    int32_t
//- 		Set decimator value. 0: no decimation, 1: divide by two, ...
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             pre   PARAM_IN    int32_t
//- 		Set the length in samples of pre-trigger buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	software_trigger   PARAM_IN    int32_t
//- 		Generate software trigger to force start acquisition (1:generate trigger)
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	  analog_trigger   PARAM_IN    int32_t
//- 		Enable threshold trigger on analog input of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital0_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 0 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital1_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 1 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital2_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 2 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital3_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 3 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	 trigger_channel   PARAM_IN    int32_t
//- 		Select channel of the oscilloscope connected to the trigger logic
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	    trigger_edge   PARAM_IN    int32_t
//- 		Select channel of the oscilloscope connected to the trigger logic
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Rising
//- 		1) Falling
//-
//- 	   trigger_level   PARAM_IN    int32_t
//- 		Level in LSB of the leading edge comparator on analog input. Use only with analog_trigger=1
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_3_SET_PARAMETERS(int32_t decimator, int32_t pre, int32_t software_trigger, int32_t analog_trigger, int32_t digital0_trigger, int32_t digital1_trigger, int32_t digital2_trigger, int32_t digital3_trigger, int32_t trigger_channel, int32_t trigger_edge, int32_t trigger_level, NI_HANDLE *handle)
{
int32_t triggermode = 0;
int r_decimator = __abstracted_reg_write(decimator, SCI_REG_Oscilloscope_3_CONFIG_DECIMATOR, handle);
int r_pre = __abstracted_reg_write(pre, SCI_REG_Oscilloscope_3_CONFIG_PRETRIGGER, handle);
int r_triglevel = __abstracted_reg_write(trigger_level, SCI_REG_Oscilloscope_3_CONFIG_TRIGGER_LEVEL, handle);
triggermode = (trigger_channel << 8)  + (software_trigger << 7 ) + (trigger_edge << 3) + (software_trigger << 1) + analog_trigger + (digital0_trigger << 2) + (digital1_trigger << 2) + digital1_trigger + (digital2_trigger << 2) + (digital2_trigger << 1) + (digital3_trigger << 2) + (digital3_trigger << 1) + digital3_trigger ; 
int r_triggermode = __abstracted_reg_write(triggermode, SCI_REG_Oscilloscope_3_CONFIG_TRIGGER_MODE, handle);
if (r_decimator == 0 & r_pre == 0 & r_triglevel == 0 & r_triggermode == 0)
    return 0;
else
    return -1;

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_3_STATUS
//-
//- Get Oscilloscope status
//-
//- ARGUMENTS:
//- 	          status  PARAM_OUT    int32_t
//- 		Return the oscilloscope status
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) No data available
//- 		1) Data available
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_3_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Oscilloscope_3_READ_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_3_POSITION
//-
//- Get Oscilloscope trigger position. The trigger position indicate the position in the output buffer of each channels where the sample at t0 occureed. PRE-TRIGGER samples before t0 is the pre-trigger data.
//-
//- ARGUMENTS:
//- 	        position  PARAM_OUT    int32_t
//- 		Return the trigger position in the data set in order to correct recustruct the pre-prigger and post trigger data
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_3_POSITION(int32_t *position,NI_HANDLE *handle)
{
return __abstracted_reg_read(position, SCI_REG_Oscilloscope_3_READ_POSITION, handle);

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_3_DOWNLOAD
//-
//- Download data from oscilloscope buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Oscilloscope_3POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Oscilloscope_3_DOWNLOAD(data_buffer, BUFFER_SIZE_Oscilloscope_3, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Oscilloscope_3 to get actual oscilloscope buffer size on FPGA
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_3_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Oscilloscope_3_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_3_RECONSTRUCT
//-
//- Take as input the downloaded buffer and decode the the different track for each channels. Channel order is the following: [0...1023] Channel 1, [1024...2047] Channel2
//- 
//- 
//-
//- ARGUMENTS:
//- 	        data_osc   PARAM_IN   uint32_t
//- 		uint32_t buffer containing the raw data download with the DOWNLOAD function
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	        position   PARAM_IN   uint32_t
//- 		Position of the trigger obtained with the POSITION function
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	     pre_trigger   PARAM_IN    int32_t
//- 		Length of the pre-trigger
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	     read_analog  PARAM_OUT   uint32_t
//- 		Analog track reordered in time. Data are encoded in unsigned data format between -32576 and 32576
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital0  PARAM_OUT   uint32_t
//- 		Digital track 0 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital1  PARAM_OUT   uint32_t
//- 		Digital track 1 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital2  PARAM_OUT   uint32_t
//- 		Digital track 2 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital3  PARAM_OUT   uint32_t
//- 		Digital track 3 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_3_RECONSTRUCT(uint32_t *data_osc, uint32_t position, int32_t pre_trigger, uint32_t *read_analog, uint32_t *read_digital0, uint32_t *read_digital1, uint32_t *read_digital2, uint32_t *read_digital3)
{
int n_ch = 2;
int n_samples = 1024;
for(int n=0; n< n_ch; n++)
{
	int current = position - pre_trigger;
	if (current > 0)
    {
	    int k = 0;
	    for (int i = current; i < n_samples - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
	    for (int i = 0; i < current - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
    }
    else
    {
	    int k = 0;
	    for (int i = n_samples+current; i < n_samples - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
	    for (int i = 0; i < n_samples + current - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
    }
}
return 0;

}
//-----------------------------------------------------------------
//-
//- RATE_METER_RateMeter_0_GET_DATA
//-
//- USAGE: 
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN   channels
//- 		number of word to download from the buffer.
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int RATE_METER_RateMeter_0_GET_DATA(uint32_t *val, uint32_t channels, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, channels, SCI_REG_RateMeter_0_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- RATE_METER_RateMeter_1_GET_DATA
//-
//- USAGE: 
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN   channels
//- 		number of word to download from the buffer.
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int RATE_METER_RateMeter_1_GET_DATA(uint32_t *val, uint32_t channels, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, channels, SCI_REG_RateMeter_1_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- RATE_METER_RateMeter_2_GET_DATA
//-
//- USAGE: 
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN   channels
//- 		number of word to download from the buffer.
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int RATE_METER_RateMeter_2_GET_DATA(uint32_t *val, uint32_t channels, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, channels, SCI_REG_RateMeter_2_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- RATE_METER_RateMeter_3_GET_DATA
//-
//- USAGE: 
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN   channels
//- 		number of word to download from the buffer.
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int RATE_METER_RateMeter_3_GET_DATA(uint32_t *val, uint32_t channels, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, channels, SCI_REG_RateMeter_3_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- Citiroc_CitirocCfg1_CONFIG
//-
//- Configure ASIC.
//-
//- ARGUMENTS:
//- 	           incfg   PARAM_IN    int32_t
//- 		Bitstream to be downloaded to the ASIC. Use integrated SciCompiler Tool to generate the bitstream or read Citiroc documentation
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int Citiroc_CitirocCfg1_CONFIG(char *incfg, NI_HANDLE *handle)
{
int i,j;
uint32_t bitstream[1152];
uint32_t cfg[32];
int result;
if (strlen(incfg) != 1144) return -1;
for (i=0;i<1152;i++) bitstream[i] = 0;
for (i=0;i<1144;i++)
{
	bitstream[i] = (incfg[i] == '0' ? 0:1);
}
for (i=0;i<36;i++)
{
	cfg[i]=0;
	for (j=0;j<32;j++)
		cfg[i] += (bitstream[i*32+j] << j);
}
result=0;
	result+=__abstracted_reg_write(cfg[0],SCI_REG_CitirocCfg1_REG_CFG0, handle);
	result+=__abstracted_reg_write(cfg[1],SCI_REG_CitirocCfg1_REG_CFG1, handle);
	result+=__abstracted_reg_write(cfg[2],SCI_REG_CitirocCfg1_REG_CFG2, handle);
	result+=__abstracted_reg_write(cfg[3],SCI_REG_CitirocCfg1_REG_CFG3, handle);
	result+=__abstracted_reg_write(cfg[4],SCI_REG_CitirocCfg1_REG_CFG4, handle);
	result+=__abstracted_reg_write(cfg[5],SCI_REG_CitirocCfg1_REG_CFG5, handle);
	result+=__abstracted_reg_write(cfg[6],SCI_REG_CitirocCfg1_REG_CFG6, handle);
	result+=__abstracted_reg_write(cfg[7],SCI_REG_CitirocCfg1_REG_CFG7, handle);
	result+=__abstracted_reg_write(cfg[8],SCI_REG_CitirocCfg1_REG_CFG8, handle);
	result+=__abstracted_reg_write(cfg[9],SCI_REG_CitirocCfg1_REG_CFG9, handle);
	result+=__abstracted_reg_write(cfg[10],SCI_REG_CitirocCfg1_REG_CFG10, handle);
	result+=__abstracted_reg_write(cfg[11],SCI_REG_CitirocCfg1_REG_CFG11, handle);
	result+=__abstracted_reg_write(cfg[12],SCI_REG_CitirocCfg1_REG_CFG12, handle);
	result+=__abstracted_reg_write(cfg[13],SCI_REG_CitirocCfg1_REG_CFG13, handle);
	result+=__abstracted_reg_write(cfg[14],SCI_REG_CitirocCfg1_REG_CFG14, handle);
	result+=__abstracted_reg_write(cfg[15],SCI_REG_CitirocCfg1_REG_CFG15, handle);
	result+=__abstracted_reg_write(cfg[16],SCI_REG_CitirocCfg1_REG_CFG16, handle);
	result+=__abstracted_reg_write(cfg[17],SCI_REG_CitirocCfg1_REG_CFG17, handle);
	result+=__abstracted_reg_write(cfg[18],SCI_REG_CitirocCfg1_REG_CFG18, handle);
	result+=__abstracted_reg_write(cfg[19],SCI_REG_CitirocCfg1_REG_CFG19, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg1_START_REG_CFG, handle);
	result+=__abstracted_reg_write(1,SCI_REG_CitirocCfg1_START_REG_CFG, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg1_START_REG_CFG, handle);
if (result!=0) return -1; else return 0;

}
//-----------------------------------------------------------------
//-
//- Citiroc_CitirocCfg1_CONFIG_MON
//-
//- Configure ASIC Monitor probe.
//-
//- ARGUMENTS:
//- 	           incfg   PARAM_IN    int32_t
//- 		Bitstream to be downloaded to the ASIC. Use integrated SciCompiler Tool to generate the bitstream or read Citiroc documentation
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int Citiroc_CitirocCfg1_CONFIG_MON(char *incfg, NI_HANDLE *handle)
{
int i,j;
uint32_t bitstream[1024];
uint32_t cfg[32];
int result;
if (strlen(incfg) != 256) return -1;
for (i=0;i<1024;i++) bitstream[i] = 0;
for (i=0;i<256;i++)
{
	bitstream[i] = (incfg[i] == '0' ? 0:1);
}
for (i=0;i<20;i++)
{
	cfg[i]=0;
	for (j=0;j<32;j++)
		cfg[i] += (bitstream[i*32+j] << j);
}
result=0;
	result+=__abstracted_reg_write(cfg[0],SCI_REG_CitirocCfg1_REG_CFG0, handle);
	result+=__abstracted_reg_write(cfg[1],SCI_REG_CitirocCfg1_REG_CFG1, handle);
	result+=__abstracted_reg_write(cfg[2],SCI_REG_CitirocCfg1_REG_CFG2, handle);
	result+=__abstracted_reg_write(cfg[3],SCI_REG_CitirocCfg1_REG_CFG3, handle);
	result+=__abstracted_reg_write(cfg[4],SCI_REG_CitirocCfg1_REG_CFG4, handle);
	result+=__abstracted_reg_write(cfg[5],SCI_REG_CitirocCfg1_REG_CFG5, handle);
	result+=__abstracted_reg_write(cfg[6],SCI_REG_CitirocCfg1_REG_CFG6, handle);
	result+=__abstracted_reg_write(cfg[7],SCI_REG_CitirocCfg1_REG_CFG7, handle);
	result+=__abstracted_reg_write(cfg[8],SCI_REG_CitirocCfg1_REG_CFG8, handle);
	result+=__abstracted_reg_write(cfg[9],SCI_REG_CitirocCfg1_REG_CFG9, handle);
	result+=__abstracted_reg_write(cfg[10],SCI_REG_CitirocCfg1_REG_CFG10, handle);
	result+=__abstracted_reg_write(cfg[11],SCI_REG_CitirocCfg1_REG_CFG11, handle);
	result+=__abstracted_reg_write(cfg[12],SCI_REG_CitirocCfg1_REG_CFG12, handle);
	result+=__abstracted_reg_write(cfg[13],SCI_REG_CitirocCfg1_REG_CFG13, handle);
	result+=__abstracted_reg_write(cfg[14],SCI_REG_CitirocCfg1_REG_CFG14, handle);
	result+=__abstracted_reg_write(cfg[15],SCI_REG_CitirocCfg1_REG_CFG15, handle);
	result+=__abstracted_reg_write(cfg[16],SCI_REG_CitirocCfg1_REG_CFG16, handle);
	result+=__abstracted_reg_write(cfg[17],SCI_REG_CitirocCfg1_REG_CFG17, handle);
	result+=__abstracted_reg_write(cfg[18],SCI_REG_CitirocCfg1_REG_CFG18, handle);
	result+=__abstracted_reg_write(cfg[19],SCI_REG_CitirocCfg1_REG_CFG19, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg1_START_REG_CFG, handle);
	result+=__abstracted_reg_write(2,SCI_REG_CitirocCfg1_START_REG_CFG, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg1_START_REG_CFG, handle);
if (result!=0) return -1; else return 0;

}
//-----------------------------------------------------------------
//-
//- Citiroc_CitirocCfg2_CONFIG
//-
//- Configure ASIC.
//-
//- ARGUMENTS:
//- 	           incfg   PARAM_IN    int32_t
//- 		Bitstream to be downloaded to the ASIC. Use integrated SciCompiler Tool to generate the bitstream or read Citiroc documentation
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int Citiroc_CitirocCfg2_CONFIG(char *incfg, NI_HANDLE *handle)
{
int i,j;
uint32_t bitstream[1152];
uint32_t cfg[32];
int result;
if (strlen(incfg) != 1144) return -1;
for (i=0;i<1152;i++) bitstream[i] = 0;
for (i=0;i<1144;i++)
{
	bitstream[i] = (incfg[i] == '0' ? 0:1);
}
for (i=0;i<36;i++)
{
	cfg[i]=0;
	for (j=0;j<32;j++)
		cfg[i] += (bitstream[i*32+j] << j);
}
result=0;
	result+=__abstracted_reg_write(cfg[0],SCI_REG_CitirocCfg2_REG_CFG0, handle);
	result+=__abstracted_reg_write(cfg[1],SCI_REG_CitirocCfg2_REG_CFG1, handle);
	result+=__abstracted_reg_write(cfg[2],SCI_REG_CitirocCfg2_REG_CFG2, handle);
	result+=__abstracted_reg_write(cfg[3],SCI_REG_CitirocCfg2_REG_CFG3, handle);
	result+=__abstracted_reg_write(cfg[4],SCI_REG_CitirocCfg2_REG_CFG4, handle);
	result+=__abstracted_reg_write(cfg[5],SCI_REG_CitirocCfg2_REG_CFG5, handle);
	result+=__abstracted_reg_write(cfg[6],SCI_REG_CitirocCfg2_REG_CFG6, handle);
	result+=__abstracted_reg_write(cfg[7],SCI_REG_CitirocCfg2_REG_CFG7, handle);
	result+=__abstracted_reg_write(cfg[8],SCI_REG_CitirocCfg2_REG_CFG8, handle);
	result+=__abstracted_reg_write(cfg[9],SCI_REG_CitirocCfg2_REG_CFG9, handle);
	result+=__abstracted_reg_write(cfg[10],SCI_REG_CitirocCfg2_REG_CFG10, handle);
	result+=__abstracted_reg_write(cfg[11],SCI_REG_CitirocCfg2_REG_CFG11, handle);
	result+=__abstracted_reg_write(cfg[12],SCI_REG_CitirocCfg2_REG_CFG12, handle);
	result+=__abstracted_reg_write(cfg[13],SCI_REG_CitirocCfg2_REG_CFG13, handle);
	result+=__abstracted_reg_write(cfg[14],SCI_REG_CitirocCfg2_REG_CFG14, handle);
	result+=__abstracted_reg_write(cfg[15],SCI_REG_CitirocCfg2_REG_CFG15, handle);
	result+=__abstracted_reg_write(cfg[16],SCI_REG_CitirocCfg2_REG_CFG16, handle);
	result+=__abstracted_reg_write(cfg[17],SCI_REG_CitirocCfg2_REG_CFG17, handle);
	result+=__abstracted_reg_write(cfg[18],SCI_REG_CitirocCfg2_REG_CFG18, handle);
	result+=__abstracted_reg_write(cfg[19],SCI_REG_CitirocCfg2_REG_CFG19, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg2_START_REG_CFG, handle);
	result+=__abstracted_reg_write(1,SCI_REG_CitirocCfg2_START_REG_CFG, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg2_START_REG_CFG, handle);
if (result!=0) return -1; else return 0;

}
//-----------------------------------------------------------------
//-
//- Citiroc_CitirocCfg2_CONFIG_MON
//-
//- Configure ASIC Monitor probe.
//-
//- ARGUMENTS:
//- 	           incfg   PARAM_IN    int32_t
//- 		Bitstream to be downloaded to the ASIC. Use integrated SciCompiler Tool to generate the bitstream or read Citiroc documentation
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int Citiroc_CitirocCfg2_CONFIG_MON(char *incfg, NI_HANDLE *handle)
{
int i,j;
uint32_t bitstream[1024];
uint32_t cfg[32];
int result;
if (strlen(incfg) != 256) return -1;
for (i=0;i<1024;i++) bitstream[i] = 0;
for (i=0;i<256;i++)
{
	bitstream[i] = (incfg[i] == '0' ? 0:1);
}
for (i=0;i<20;i++)
{
	cfg[i]=0;
	for (j=0;j<32;j++)
		cfg[i] += (bitstream[i*32+j] << j);
}
result=0;
	result+=__abstracted_reg_write(cfg[0],SCI_REG_CitirocCfg2_REG_CFG0, handle);
	result+=__abstracted_reg_write(cfg[1],SCI_REG_CitirocCfg2_REG_CFG1, handle);
	result+=__abstracted_reg_write(cfg[2],SCI_REG_CitirocCfg2_REG_CFG2, handle);
	result+=__abstracted_reg_write(cfg[3],SCI_REG_CitirocCfg2_REG_CFG3, handle);
	result+=__abstracted_reg_write(cfg[4],SCI_REG_CitirocCfg2_REG_CFG4, handle);
	result+=__abstracted_reg_write(cfg[5],SCI_REG_CitirocCfg2_REG_CFG5, handle);
	result+=__abstracted_reg_write(cfg[6],SCI_REG_CitirocCfg2_REG_CFG6, handle);
	result+=__abstracted_reg_write(cfg[7],SCI_REG_CitirocCfg2_REG_CFG7, handle);
	result+=__abstracted_reg_write(cfg[8],SCI_REG_CitirocCfg2_REG_CFG8, handle);
	result+=__abstracted_reg_write(cfg[9],SCI_REG_CitirocCfg2_REG_CFG9, handle);
	result+=__abstracted_reg_write(cfg[10],SCI_REG_CitirocCfg2_REG_CFG10, handle);
	result+=__abstracted_reg_write(cfg[11],SCI_REG_CitirocCfg2_REG_CFG11, handle);
	result+=__abstracted_reg_write(cfg[12],SCI_REG_CitirocCfg2_REG_CFG12, handle);
	result+=__abstracted_reg_write(cfg[13],SCI_REG_CitirocCfg2_REG_CFG13, handle);
	result+=__abstracted_reg_write(cfg[14],SCI_REG_CitirocCfg2_REG_CFG14, handle);
	result+=__abstracted_reg_write(cfg[15],SCI_REG_CitirocCfg2_REG_CFG15, handle);
	result+=__abstracted_reg_write(cfg[16],SCI_REG_CitirocCfg2_REG_CFG16, handle);
	result+=__abstracted_reg_write(cfg[17],SCI_REG_CitirocCfg2_REG_CFG17, handle);
	result+=__abstracted_reg_write(cfg[18],SCI_REG_CitirocCfg2_REG_CFG18, handle);
	result+=__abstracted_reg_write(cfg[19],SCI_REG_CitirocCfg2_REG_CFG19, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg2_START_REG_CFG, handle);
	result+=__abstracted_reg_write(2,SCI_REG_CitirocCfg2_START_REG_CFG, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg2_START_REG_CFG, handle);
if (result!=0) return -1; else return 0;

}
//-----------------------------------------------------------------
//-
//- Citiroc_CitirocCfg3_CONFIG
//-
//- Configure ASIC.
//-
//- ARGUMENTS:
//- 	           incfg   PARAM_IN    int32_t
//- 		Bitstream to be downloaded to the ASIC. Use integrated SciCompiler Tool to generate the bitstream or read Citiroc documentation
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int Citiroc_CitirocCfg3_CONFIG(char *incfg, NI_HANDLE *handle)
{
int i,j;
uint32_t bitstream[1152];
uint32_t cfg[32];
int result;
if (strlen(incfg) != 1144) return -1;
for (i=0;i<1152;i++) bitstream[i] = 0;
for (i=0;i<1144;i++)
{
	bitstream[i] = (incfg[i] == '0' ? 0:1);
}
for (i=0;i<36;i++)
{
	cfg[i]=0;
	for (j=0;j<32;j++)
		cfg[i] += (bitstream[i*32+j] << j);
}
result=0;
	result+=__abstracted_reg_write(cfg[0],SCI_REG_CitirocCfg3_REG_CFG0, handle);
	result+=__abstracted_reg_write(cfg[1],SCI_REG_CitirocCfg3_REG_CFG1, handle);
	result+=__abstracted_reg_write(cfg[2],SCI_REG_CitirocCfg3_REG_CFG2, handle);
	result+=__abstracted_reg_write(cfg[3],SCI_REG_CitirocCfg3_REG_CFG3, handle);
	result+=__abstracted_reg_write(cfg[4],SCI_REG_CitirocCfg3_REG_CFG4, handle);
	result+=__abstracted_reg_write(cfg[5],SCI_REG_CitirocCfg3_REG_CFG5, handle);
	result+=__abstracted_reg_write(cfg[6],SCI_REG_CitirocCfg3_REG_CFG6, handle);
	result+=__abstracted_reg_write(cfg[7],SCI_REG_CitirocCfg3_REG_CFG7, handle);
	result+=__abstracted_reg_write(cfg[8],SCI_REG_CitirocCfg3_REG_CFG8, handle);
	result+=__abstracted_reg_write(cfg[9],SCI_REG_CitirocCfg3_REG_CFG9, handle);
	result+=__abstracted_reg_write(cfg[10],SCI_REG_CitirocCfg3_REG_CFG10, handle);
	result+=__abstracted_reg_write(cfg[11],SCI_REG_CitirocCfg3_REG_CFG11, handle);
	result+=__abstracted_reg_write(cfg[12],SCI_REG_CitirocCfg3_REG_CFG12, handle);
	result+=__abstracted_reg_write(cfg[13],SCI_REG_CitirocCfg3_REG_CFG13, handle);
	result+=__abstracted_reg_write(cfg[14],SCI_REG_CitirocCfg3_REG_CFG14, handle);
	result+=__abstracted_reg_write(cfg[15],SCI_REG_CitirocCfg3_REG_CFG15, handle);
	result+=__abstracted_reg_write(cfg[16],SCI_REG_CitirocCfg3_REG_CFG16, handle);
	result+=__abstracted_reg_write(cfg[17],SCI_REG_CitirocCfg3_REG_CFG17, handle);
	result+=__abstracted_reg_write(cfg[18],SCI_REG_CitirocCfg3_REG_CFG18, handle);
	result+=__abstracted_reg_write(cfg[19],SCI_REG_CitirocCfg3_REG_CFG19, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg3_START_REG_CFG, handle);
	result+=__abstracted_reg_write(1,SCI_REG_CitirocCfg3_START_REG_CFG, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg3_START_REG_CFG, handle);
if (result!=0) return -1; else return 0;

}
//-----------------------------------------------------------------
//-
//- Citiroc_CitirocCfg3_CONFIG_MON
//-
//- Configure ASIC Monitor probe.
//-
//- ARGUMENTS:
//- 	           incfg   PARAM_IN    int32_t
//- 		Bitstream to be downloaded to the ASIC. Use integrated SciCompiler Tool to generate the bitstream or read Citiroc documentation
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int Citiroc_CitirocCfg3_CONFIG_MON(char *incfg, NI_HANDLE *handle)
{
int i,j;
uint32_t bitstream[1024];
uint32_t cfg[32];
int result;
if (strlen(incfg) != 256) return -1;
for (i=0;i<1024;i++) bitstream[i] = 0;
for (i=0;i<256;i++)
{
	bitstream[i] = (incfg[i] == '0' ? 0:1);
}
for (i=0;i<20;i++)
{
	cfg[i]=0;
	for (j=0;j<32;j++)
		cfg[i] += (bitstream[i*32+j] << j);
}
result=0;
	result+=__abstracted_reg_write(cfg[0],SCI_REG_CitirocCfg3_REG_CFG0, handle);
	result+=__abstracted_reg_write(cfg[1],SCI_REG_CitirocCfg3_REG_CFG1, handle);
	result+=__abstracted_reg_write(cfg[2],SCI_REG_CitirocCfg3_REG_CFG2, handle);
	result+=__abstracted_reg_write(cfg[3],SCI_REG_CitirocCfg3_REG_CFG3, handle);
	result+=__abstracted_reg_write(cfg[4],SCI_REG_CitirocCfg3_REG_CFG4, handle);
	result+=__abstracted_reg_write(cfg[5],SCI_REG_CitirocCfg3_REG_CFG5, handle);
	result+=__abstracted_reg_write(cfg[6],SCI_REG_CitirocCfg3_REG_CFG6, handle);
	result+=__abstracted_reg_write(cfg[7],SCI_REG_CitirocCfg3_REG_CFG7, handle);
	result+=__abstracted_reg_write(cfg[8],SCI_REG_CitirocCfg3_REG_CFG8, handle);
	result+=__abstracted_reg_write(cfg[9],SCI_REG_CitirocCfg3_REG_CFG9, handle);
	result+=__abstracted_reg_write(cfg[10],SCI_REG_CitirocCfg3_REG_CFG10, handle);
	result+=__abstracted_reg_write(cfg[11],SCI_REG_CitirocCfg3_REG_CFG11, handle);
	result+=__abstracted_reg_write(cfg[12],SCI_REG_CitirocCfg3_REG_CFG12, handle);
	result+=__abstracted_reg_write(cfg[13],SCI_REG_CitirocCfg3_REG_CFG13, handle);
	result+=__abstracted_reg_write(cfg[14],SCI_REG_CitirocCfg3_REG_CFG14, handle);
	result+=__abstracted_reg_write(cfg[15],SCI_REG_CitirocCfg3_REG_CFG15, handle);
	result+=__abstracted_reg_write(cfg[16],SCI_REG_CitirocCfg3_REG_CFG16, handle);
	result+=__abstracted_reg_write(cfg[17],SCI_REG_CitirocCfg3_REG_CFG17, handle);
	result+=__abstracted_reg_write(cfg[18],SCI_REG_CitirocCfg3_REG_CFG18, handle);
	result+=__abstracted_reg_write(cfg[19],SCI_REG_CitirocCfg3_REG_CFG19, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg3_START_REG_CFG, handle);
	result+=__abstracted_reg_write(2,SCI_REG_CitirocCfg3_START_REG_CFG, handle);
	result+=__abstracted_reg_write(0,SCI_REG_CitirocCfg3_START_REG_CFG, handle);
if (result!=0) return -1; else return 0;

}
//-----------------------------------------------------------------
//-
//- CitirocFRAME_CitirocFrame0_GetStatus
//-
//- Get status
//-
//- ARGUMENTS:
//- 	is_data_available  PARAM_OUT    int32_t
//- 		Return the component status
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) No data available
//- 		1) Data available
//-
//- 	  word_available  PARAM_OUT    int32_t
//- 		Number of word available in the FIFO
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int CitirocFRAME_CitirocFrame0_GetStatus(uint32_t *is_data_available, uint32_t *word_available, NI_HANDLE *handle)
{
 uint32_t temp;
 int res;
 res = __abstracted_reg_read(&temp, SCI_REG_CitirocFrame0_STATUS, handle);
     *is_data_available = temp & 0x01;
     *word_available = (temp >> 16) & 0xFFFF;
 return res;

}
//-----------------------------------------------------------------
//-
//- CitirocFRAME_CitirocFrame0_RESET
//-
//- Reset FIFO content.
//-
//- ARGUMENTS:
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int CitirocFRAME_CitirocFrame0_RESET(NI_HANDLE *handle)
{
return __abstracted_reg_write(0x100, SCI_REG_CitirocFrame0_CONTROL, handle);

}
//-----------------------------------------------------------------
//-
//- CitirocFRAME_CitirocFrame0_START
//-
//- Reset FIFO content.
//-
//- ARGUMENTS:
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int CitirocFRAME_CitirocFrame0_START(NI_HANDLE *handle)
{
return __abstracted_reg_write(0, SCI_REG_CitirocFrame0_CONTROL, handle);

}
//-----------------------------------------------------------------
//-
//- CitirocFRAME_CitirocFrame0_DOWNLOAD
//-
//- Download data from buffer. 
//- 
//- USAGE: 
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. 
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int CitirocFRAME_CitirocFrame0_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_fifo_read(val, size, SCI_REG_CitirocFrame0_FIFOADDRESS, SCI_REG_CitirocFrame0_STATUS, 1, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- CitirocFRAME_CitirocFrame0_RECONSTRUCT_DATA
//-
//- Take in input a circular buffer (buffer_handle) allocated with the function Utility_ALLOCATE_DOWNLOAD_BUFFER 
//- and filled with downloaded data Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER and decoded the packet  
//- created with the Image (Frame Transfer block).
//- The function internally allocate the output data structure t_ASIC_packet_collection and fill it with packed data
//- decoded. Release the memory allocated by the function with free_CitirocFRAME_packet_collection(buffer) function
//- in order to avoid memory leakage
//- ----------------------------------------
//- USAGE: 
//-   t_FRAME_packet_collection decoded_packets; 
//-   uint32_t data_frame[100000]; 
//-   void *BufferDownloadHandler = NULL;
//- 
//-   Utility_ALLOCATE_DOWNLOAD_BUFFER(&BufferDownloadHandler, 1024*1024);
//-   .... initialize frame transfer ....
//-   while (1){
//-     CitirocFRAME_CitirocFrame0_DOWNLOAD(&data_frame, N_Packet * (PacketSize), timeout_frame, &handle, &read_data_frame, &valid_data_frame); 
//-     Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER(BufferDownloadHandler, data_frame, valid_data_frame, &valid_data_enqueued); 
//-     if (CitirocFRAME_CitirocFrame0_RECONSTRUCT_DATA(BufferDownloadHandler, &decoded_packets) == 0) { 
//-         .... process data contained in decoded_packets....
//-         free_FRAME_packet_collectionvoid(&decoded_packets);
//-     }
//- 
//- 
//-
//- ARGUMENTS:
//- 	   buffer_handle   PARAM_IN       void
//- 		void pointer to the allocated memory area
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	 decoded_packets  PARAM_OUT t_FRAME_packet_collection
//- 		Output vector containing the decoded data
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int CitirocFRAME_CitirocFrame0_RECONSTRUCT_DATA(void *buffer_handle, t_ASIC_packet_collection *decoded_packets)
{
	cbuf_handle_t cbuf;
	cbuf = (cbuf_handle_t)buffer_handle;
	int n_ch = 32;
	int PacketSize = n_ch + 5;
	int in_sync = 0;
	uint64_t event_timecode = 0;
	uint32_t ev_energy = 0;
	uint32_t datarow[100];
	uint32_t mpe = 0;
	int ch_index = 0;
	int i = 0, j;
	int k = 0;
	//check if we have elements in the circular buffer
	if (circular_buf_size(cbuf) < PacketSize) return -1;
	//allocate output
	int possible_packets = (circular_buf_size(cbuf) / PacketSize) + 10;
	decoded_packets->packets = (t_ASIC_packet *)malloc(possible_packets * sizeof(t_ASIC_packet));
	if (decoded_packets->packets == NULL) return -2;
	for (i = 0; i < possible_packets; i++)
	{
		decoded_packets->packets[i].Hit = (uint32_t *)malloc(n_ch * sizeof(uint32_t));
		decoded_packets->packets[i].ChargeHg = (uint32_t *)malloc(n_ch * sizeof(uint32_t));
		decoded_packets->packets[i].ChargeLg = (uint32_t *)malloc(n_ch * sizeof(uint32_t));
		
		if ((decoded_packets->packets[i].ChargeHg == NULL) ||
			(decoded_packets->packets[i].Hit == NULL) ||
			(decoded_packets->packets[i].ChargeLg == NULL))

		{
			for (j = 0; j < i; j++)
			{
				if (decoded_packets->packets[i].ChargeHg != NULL)
					free(decoded_packets->packets[i].ChargeHg);
				if (decoded_packets->packets[i].ChargeLg != NULL)
					free(decoded_packets->packets[i].ChargeLg);
				if (decoded_packets->packets[i].Hit != NULL)
					free(decoded_packets->packets[i].Hit);
			}
			if (decoded_packets->packets != NULL)
				free(decoded_packets->packets);

			return -2;
		}
	}
	decoded_packets->allocated_packets = possible_packets;
	decoded_packets->valid_packets = 0;

	//process packets
	while (circular_buf_size(cbuf)> PacketSize)
	{
		circular_buf_get(cbuf, &mpe);

		if (in_sync == 0) {
			if (mpe>>4 != 0x8000000)
			{
				decoded_packets->packets[k].AsicID = mpe & 0xf;
				//printf("w");
				continue;
			}
			in_sync = 1;
			continue;
		}
		if (in_sync == 1) {
			decoded_packets->packets[k].Time_Code = mpe ;
			in_sync = 2;
			continue;
		}
		if (in_sync == 2) {
			decoded_packets->packets[k].RunTime_Code = mpe ;
			in_sync = 3;
			continue;
		}
		if (in_sync == 3) {
			decoded_packets->packets[k].RunTime_Code += (mpe<<32L);
			in_sync = 4;
			continue;
		}
		if (in_sync == 4) {
			decoded_packets->packets[k].Pack_Id = mpe;
			in_sync = 5;
			j = 0;
			continue;
		}
		if (in_sync == 5) 
		{
			datarow[j * 3 + 0] = (mpe >> 0) & 0x3FFF;
			datarow[j * 3 + 1] = (mpe >> 14) & 0x3FFF;
			datarow[j * 3 + 2] = (mpe >> 28) & 0x1;
				j++;
				if (j == 32)
					in_sync = 6;
				continue;
		}
		if (in_sync == 6) {
			if ((mpe & 0xc0000000) == 0xc0000000)
			{
				for (i = 0; i < 32; i++)
				{
					decoded_packets->packets[k].Hit [i] = (datarow[(i * 3) + 2] & 0x1);
					decoded_packets->packets[k].ChargeHg[i] = datarow[(i * 3) + 0];
					decoded_packets->packets[k].ChargeLg[i] = datarow[(i * 3) + 1];
				}
					in_sync = 0;
					k++;
					decoded_packets->valid_packets++;
			}
			else
			{
				in_sync = 0;
			}
			continue;
		}
	}
}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_0_START
//-
//- Start Oscilloscope acquisition.
//-
//- ARGUMENTS:
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_0_START(NI_HANDLE *handle)

{
int r1 = __abstracted_reg_write(0,SCI_REG_Oscilloscope_0_CONFIG_ARM, handle);
int r2 = __abstracted_reg_write(1,SCI_REG_Oscilloscope_0_CONFIG_ARM, handle);
if ((r1 == 0) && (r2 == 0))
    return 0;
else
    return -1;

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_0_SET_PARAMETERS
//-
//- Configure oscilloscope parameters
//-
//- ARGUMENTS:
//- 	       decimator   PARAM_IN    int32_t
//- 		Set decimator value. 0: no decimation, 1: divide by two, ...
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             pre   PARAM_IN    int32_t
//- 		Set the length in samples of pre-trigger buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	software_trigger   PARAM_IN    int32_t
//- 		Generate software trigger to force start acquisition (1:generate trigger)
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	  analog_trigger   PARAM_IN    int32_t
//- 		Enable threshold trigger on analog input of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital0_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 0 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital1_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 1 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital2_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 2 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital3_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 3 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	 trigger_channel   PARAM_IN    int32_t
//- 		Select channel of the oscilloscope connected to the trigger logic
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	    trigger_edge   PARAM_IN    int32_t
//- 		Select channel of the oscilloscope connected to the trigger logic
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Rising
//- 		1) Falling
//-
//- 	   trigger_level   PARAM_IN    int32_t
//- 		Level in LSB of the leading edge comparator on analog input. Use only with analog_trigger=1
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_0_SET_PARAMETERS(int32_t decimator, int32_t pre, int32_t software_trigger, int32_t analog_trigger, int32_t digital0_trigger, int32_t digital1_trigger, int32_t digital2_trigger, int32_t digital3_trigger, int32_t trigger_channel, int32_t trigger_edge, int32_t trigger_level, NI_HANDLE *handle)
{
int32_t triggermode = 0;
int r_decimator = __abstracted_reg_write(decimator, SCI_REG_Oscilloscope_0_CONFIG_DECIMATOR, handle);
int r_pre = __abstracted_reg_write(pre, SCI_REG_Oscilloscope_0_CONFIG_PRETRIGGER, handle);
int r_triglevel = __abstracted_reg_write(trigger_level, SCI_REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL, handle);
triggermode = (trigger_channel << 8)  + (software_trigger << 7 ) + (trigger_edge << 3) + (software_trigger << 1) + analog_trigger + (digital0_trigger << 2) + (digital1_trigger << 2) + digital1_trigger + (digital2_trigger << 2) + (digital2_trigger << 1) + (digital3_trigger << 2) + (digital3_trigger << 1) + digital3_trigger ; 
int r_triggermode = __abstracted_reg_write(triggermode, SCI_REG_Oscilloscope_0_CONFIG_TRIGGER_MODE, handle);
if (r_decimator == 0 & r_pre == 0 & r_triglevel == 0 & r_triggermode == 0)
    return 0;
else
    return -1;

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_0_STATUS
//-
//- Get Oscilloscope status
//-
//- ARGUMENTS:
//- 	          status  PARAM_OUT    int32_t
//- 		Return the oscilloscope status
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) No data available
//- 		1) Data available
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_0_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Oscilloscope_0_READ_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_0_POSITION
//-
//- Get Oscilloscope trigger position. The trigger position indicate the position in the output buffer of each channels where the sample at t0 occureed. PRE-TRIGGER samples before t0 is the pre-trigger data.
//-
//- ARGUMENTS:
//- 	        position  PARAM_OUT    int32_t
//- 		Return the trigger position in the data set in order to correct recustruct the pre-prigger and post trigger data
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_0_POSITION(int32_t *position,NI_HANDLE *handle)
{
return __abstracted_reg_read(position, SCI_REG_Oscilloscope_0_READ_POSITION, handle);

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_0_DOWNLOAD
//-
//- Download data from oscilloscope buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Oscilloscope_0POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Oscilloscope_0_DOWNLOAD(data_buffer, BUFFER_SIZE_Oscilloscope_0, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Oscilloscope_0 to get actual oscilloscope buffer size on FPGA
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_0_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Oscilloscope_0_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_0_RECONSTRUCT
//-
//- Take as input the downloaded buffer and decode the the different track for each channels. Channel order is the following: [0...1023] Channel 1, [1024...2047] Channel2
//- 
//- 
//-
//- ARGUMENTS:
//- 	        data_osc   PARAM_IN   uint32_t
//- 		uint32_t buffer containing the raw data download with the DOWNLOAD function
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	        position   PARAM_IN   uint32_t
//- 		Position of the trigger obtained with the POSITION function
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	     pre_trigger   PARAM_IN    int32_t
//- 		Length of the pre-trigger
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	     read_analog  PARAM_OUT   uint32_t
//- 		Analog track reordered in time. Data are encoded in unsigned data format between -32576 and 32576
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital0  PARAM_OUT   uint32_t
//- 		Digital track 0 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital1  PARAM_OUT   uint32_t
//- 		Digital track 1 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital2  PARAM_OUT   uint32_t
//- 		Digital track 2 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital3  PARAM_OUT   uint32_t
//- 		Digital track 3 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_0_RECONSTRUCT(uint32_t *data_osc, uint32_t position, int32_t pre_trigger, uint32_t *read_analog, uint32_t *read_digital0, uint32_t *read_digital1, uint32_t *read_digital2, uint32_t *read_digital3)
{
int n_ch = 2;
int n_samples = 1024;
for(int n=0; n< n_ch; n++)
{
	int current = position - pre_trigger;
	if (current > 0)
    {
	    int k = 0;
	    for (int i = current; i < n_samples - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
	    for (int i = 0; i < current - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
    }
    else
    {
	    int k = 0;
	    for (int i = n_samples+current; i < n_samples - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
	    for (int i = 0; i < n_samples + current - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
    }
}
return 0;

}
