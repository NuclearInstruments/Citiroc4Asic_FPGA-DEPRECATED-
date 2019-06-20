#include "Def.h"
#include "niusb3_core.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

#include  "DT5550W-Citiroc4Asic_lib.h"

#define BOARD_SERIAL_NUMBER "NI120012"




int main(int argc, char* argv[])
{
	NI_HANDLE handle;
	int ret;
	uint32_t    val;


	USB3_Init();


	if(USB3_ConnectDevice(BOARD_SERIAL_NUMBER, &handle) != 0) { printf("Unable to connect to the board!\n"); return (-1); };
#ifndef CUSTOM_EXAMPLE		
	
	/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

	float voltage;
	float current;
	bool enable;
	AFE_USB3_SetIICControllerBaseAddress(SCI_REG_i2c_master_0_CTRL, SCI_REG_i2c_master_0_MON, &handle);
	GetHV_A7585D(&enable, &voltage, &current, &handle);
	SetHV_A7585D(true, 35.0, &handle);
	for (int cy = 0; cy < 5; cy++)
	{
		GetHV_A7585D(&enable, &voltage, &current, &handle);
		printf("%d v:%f i:%f\n", enable, voltage, current);
		Sleep(500);
	}
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

char ASIC_CONFIG[] = "0000000000000000000000000000000000000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100010000000000000000000000000000000000000000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000011100011001000001100100110011110100000111111111101111111010011111111001111111111011001011";
Citiroc_CitirocCfg0_CONFIG(ASIC_CONFIG, &handle);
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

	uint32_t status_osc = 0;
	uint32_t data_osc[1024];
	uint32_t read_data_osc;
	uint32_t valid_data_osc;
	uint32_t position = 0;
	int32_t decimator = 0;
	int32_t pre_trigger = 100;
	int32_t software_trigger = 0;
	int32_t analog_trigger = 1;
	int32_t digital0_trigger = 0;
	int32_t digital1_trigger = 0;
	int32_t digital2_trigger = 0;
	int32_t digital3_trigger = 0;
	int32_t trigger_channel = 0;
	int32_t trigger_edge = 0;
	int32_t trigger_level = 1000;
	int32_t timeout_osc = 1000;
	int32_t size_osc = 1024;
	uint32_t read_analog[1024];
	uint32_t read_digital0[1024];
	uint32_t read_digital1[1024];
	uint32_t read_digital2[1024];
	uint32_t read_digital3[1024];
	int Osc_Events = 10;
	int e = 0;
	while (e<Osc_Events)
	{
		if (OSCILLOSCOPE_Oscilloscope_1_SET_PARAMETERS(decimator, pre_trigger, software_trigger, analog_trigger, digital0_trigger, digital1_trigger,
			digital2_trigger, digital3_trigger, trigger_channel, trigger_edge, trigger_level, &handle) != 0) printf("Set Parameters Error");
		if (OSCILLOSCOPE_Oscilloscope_1_START(&handle) != 0) printf("Start Error");
		while (status_osc != 1)
			if (OSCILLOSCOPE_Oscilloscope_1_STATUS(&status_osc, &handle) != 0) printf("Status Error");

		if (OSCILLOSCOPE_Oscilloscope_1_POSITION(&position, &handle) != 0) printf("Position Error");
		if (OSCILLOSCOPE_Oscilloscope_1_DOWNLOAD(&data_osc, size_osc, timeout_osc, &handle, &read_data_osc, &valid_data_osc) != 0) printf("Get Data Error");
		if (OSCILLOSCOPE_Oscilloscope_1_RECONSTRUCT(&data_osc, position, pre_trigger, &read_analog, &read_digital0, &read_digital1, &read_digital2, &read_digital3) != 0) printf("Reconstruction Error");
		e++;
	}
	printf("Download Finished");
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

	uint32_t status_osc = 0;
	uint32_t data_osc[1024];
	uint32_t read_data_osc;
	uint32_t valid_data_osc;
	uint32_t position = 0;
	int32_t decimator = 0;
	int32_t pre_trigger = 100;
	int32_t software_trigger = 0;
	int32_t analog_trigger = 1;
	int32_t digital0_trigger = 0;
	int32_t digital1_trigger = 0;
	int32_t digital2_trigger = 0;
	int32_t digital3_trigger = 0;
	int32_t trigger_channel = 0;
	int32_t trigger_edge = 0;
	int32_t trigger_level = 1000;
	int32_t timeout_osc = 1000;
	int32_t size_osc = 1024;
	uint32_t read_analog[1024];
	uint32_t read_digital0[1024];
	uint32_t read_digital1[1024];
	uint32_t read_digital2[1024];
	uint32_t read_digital3[1024];
	int Osc_Events = 10;
	int e = 0;
	while (e<Osc_Events)
	{
		if (OSCILLOSCOPE_Oscilloscope_2_SET_PARAMETERS(decimator, pre_trigger, software_trigger, analog_trigger, digital0_trigger, digital1_trigger,
			digital2_trigger, digital3_trigger, trigger_channel, trigger_edge, trigger_level, &handle) != 0) printf("Set Parameters Error");
		if (OSCILLOSCOPE_Oscilloscope_2_START(&handle) != 0) printf("Start Error");
		while (status_osc != 1)
			if (OSCILLOSCOPE_Oscilloscope_2_STATUS(&status_osc, &handle) != 0) printf("Status Error");

		if (OSCILLOSCOPE_Oscilloscope_2_POSITION(&position, &handle) != 0) printf("Position Error");
		if (OSCILLOSCOPE_Oscilloscope_2_DOWNLOAD(&data_osc, size_osc, timeout_osc, &handle, &read_data_osc, &valid_data_osc) != 0) printf("Get Data Error");
		if (OSCILLOSCOPE_Oscilloscope_2_RECONSTRUCT(&data_osc, position, pre_trigger, &read_analog, &read_digital0, &read_digital1, &read_digital2, &read_digital3) != 0) printf("Reconstruction Error");
		e++;
	}
	printf("Download Finished");
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

	uint32_t status_osc = 0;
	uint32_t data_osc[1024];
	uint32_t read_data_osc;
	uint32_t valid_data_osc;
	uint32_t position = 0;
	int32_t decimator = 0;
	int32_t pre_trigger = 100;
	int32_t software_trigger = 0;
	int32_t analog_trigger = 1;
	int32_t digital0_trigger = 0;
	int32_t digital1_trigger = 0;
	int32_t digital2_trigger = 0;
	int32_t digital3_trigger = 0;
	int32_t trigger_channel = 0;
	int32_t trigger_edge = 0;
	int32_t trigger_level = 1000;
	int32_t timeout_osc = 1000;
	int32_t size_osc = 1024;
	uint32_t read_analog[1024];
	uint32_t read_digital0[1024];
	uint32_t read_digital1[1024];
	uint32_t read_digital2[1024];
	uint32_t read_digital3[1024];
	int Osc_Events = 10;
	int e = 0;
	while (e<Osc_Events)
	{
		if (OSCILLOSCOPE_Oscilloscope_3_SET_PARAMETERS(decimator, pre_trigger, software_trigger, analog_trigger, digital0_trigger, digital1_trigger,
			digital2_trigger, digital3_trigger, trigger_channel, trigger_edge, trigger_level, &handle) != 0) printf("Set Parameters Error");
		if (OSCILLOSCOPE_Oscilloscope_3_START(&handle) != 0) printf("Start Error");
		while (status_osc != 1)
			if (OSCILLOSCOPE_Oscilloscope_3_STATUS(&status_osc, &handle) != 0) printf("Status Error");

		if (OSCILLOSCOPE_Oscilloscope_3_POSITION(&position, &handle) != 0) printf("Position Error");
		if (OSCILLOSCOPE_Oscilloscope_3_DOWNLOAD(&data_osc, size_osc, timeout_osc, &handle, &read_data_osc, &valid_data_osc) != 0) printf("Get Data Error");
		if (OSCILLOSCOPE_Oscilloscope_3_RECONSTRUCT(&data_osc, position, pre_trigger, &read_analog, &read_digital0, &read_digital1, &read_digital2, &read_digital3) != 0) printf("Reconstruction Error");
		e++;
	}
	printf("Download Finished");
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

char ASIC_CONFIG[] = "0000000000000000000000000000000000000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100010000000000000000000000000000000000000000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000011100011001000001100100110011110100000111111111101111111010011111111001111111111011001011";
Citiroc_CitirocCfg0_CONFIG(ASIC_CONFIG, &handle);
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

char ASIC_CONFIG[] = "0000000000000000000000000000000000000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100010000000000000000000000000000000000000000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000011100011001000001100100110011110100000111111111101111111010011111111001111111111011001011";
Citiroc_CitirocCfg0_CONFIG(ASIC_CONFIG, &handle);
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

char ASIC_CONFIG[] = "0000000000000000000000000000000000000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100010000000000000000000000000000000000000000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000011100011001000001100100110011110100000111111111101111111010011111111001111111111011001011";
Citiroc_CitirocCfg0_CONFIG(ASIC_CONFIG, &handle);
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE


	uint32_t N_Packet = 100;
	uint32_t data_frame[100000];
	uint32_t read_data_frame;
	uint32_t valid_data_frame;
	uint32_t valid_data_enqueued;
	int32_t timeout_frame = 1000;
	t_ASIC_packet_collection decoded_packets;
	
	void *BufferDownloadHandler = NULL;
	Utility_ALLOCATE_DOWNLOAD_BUFFER(&BufferDownloadHandler, 1024 * 1024);

	Citiroc_ALLFIFO_FLUSH(&handle);
	CitirocFRAME_CitirocFrame0_START(&handle);

	while (1)
	{
		uint32_t is_data_available =0;
		uint32_t word_available =0;
		CitirocFRAME_CitirocFrame0_GetStatus(&is_data_available, &word_available, &handle);

		if (is_data_available)
		{
			if (CitirocFRAME_CitirocFrame0_DOWNLOAD(&data_frame, N_Packet * (5 + 32), timeout_frame, &handle, &read_data_frame, &valid_data_frame) != 0) printf("Data Download Error");
			{
				valid_data_enqueued = 0;
				Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER(BufferDownloadHandler, data_frame, valid_data_frame, &valid_data_enqueued);
				CitirocFRAME_CitirocFrame0_RECONSTRUCT_DATA(BufferDownloadHandler, &decoded_packets);

				if (decoded_packets.valid_packets > 0)
				{
					printf("\n\nPacket %8d, timecode: %12d, ASIC[%d]\n", decoded_packets.packets[0].Pack_Id, decoded_packets.packets[0].Time_Code, decoded_packets.packets[0].AsicID);
					for (int i = 0; i < 32; i++)
					{
						printf("%2d - %5d\n", i, decoded_packets.packets[0].Charge[i]);
					}
				}

				free_CitirocFRAME_packet_collection(&decoded_packets);


			}
		}

	}

*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

	uint32_t status_osc = 0;
	uint32_t data_osc[1024];
	uint32_t read_data_osc;
	uint32_t valid_data_osc;
	uint32_t position = 0;
	int32_t decimator = 0;
	int32_t pre_trigger = 100;
	int32_t software_trigger = 0;
	int32_t analog_trigger = 1;
	int32_t digital0_trigger = 0;
	int32_t digital1_trigger = 0;
	int32_t digital2_trigger = 0;
	int32_t digital3_trigger = 0;
	int32_t trigger_channel = 0;
	int32_t trigger_edge = 0;
	int32_t trigger_level = 1000;
	int32_t timeout_osc = 1000;
	int32_t size_osc = 1024;
	uint32_t read_analog[1024];
	uint32_t read_digital0[1024];
	uint32_t read_digital1[1024];
	uint32_t read_digital2[1024];
	uint32_t read_digital3[1024];
	int Osc_Events = 10;
	int e = 0;
	while (e<Osc_Events)
	{
		if (OSCILLOSCOPE_Oscilloscope_0_SET_PARAMETERS(decimator, pre_trigger, software_trigger, analog_trigger, digital0_trigger, digital1_trigger,
			digital2_trigger, digital3_trigger, trigger_channel, trigger_edge, trigger_level, &handle) != 0) printf("Set Parameters Error");
		if (OSCILLOSCOPE_Oscilloscope_0_START(&handle) != 0) printf("Start Error");
		while (status_osc != 1)
			if (OSCILLOSCOPE_Oscilloscope_0_STATUS(&status_osc, &handle) != 0) printf("Status Error");

		if (OSCILLOSCOPE_Oscilloscope_0_POSITION(&position, &handle) != 0) printf("Position Error");
		if (OSCILLOSCOPE_Oscilloscope_0_DOWNLOAD(&data_osc, size_osc, timeout_osc, &handle, &read_data_osc, &valid_data_osc) != 0) printf("Get Data Error");
		if (OSCILLOSCOPE_Oscilloscope_0_RECONSTRUCT(&data_osc, position, pre_trigger, &read_analog, &read_digital0, &read_digital1, &read_digital2, &read_digital3) != 0) printf("Reconstruction Error");
		e++;
	}
	printf("Download Finished");
*/


	
#else

#endif

	return 0;
}

 