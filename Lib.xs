#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <comedilib.h>

#include "const-c.inc"

MODULE = Comedi::Lib		PACKAGE = Comedi::Lib		

INCLUDE: const-xs.inc

#/* Function Reference [www.comedi.org/doc/index.html] */

#/* comedi_t * */
int
comedi_close(device)
comedi_t *device;

comedi_t *
comedi_open(filename)
const char *filename;

int
comedi_loglevel(loglevel)
int loglevel;

void
comedi_perror(s)
const char *s;

char *
comedi_strerror(n)
int n;

int
comedi_errno()

int
comedi_fileno(device)
comedi_t *device;

int
comedi_get_n_subdevices(device)
comedi_t *device;

int
comedi_get_version_code(device)
comedi_t *device;

char *
comedi_get_driver_name(device)
comedi_t *device;

char *
comedi_get_board_name(device)
comedi_t *device;

int
comedi_get_subdevice_type(device, subdevice)
comedi_t *device;
unsigned int subdevice;

int
comedi_find_subdevice_by_type(device, type, start_subdevice)
comedi_t *device;
int type;
unsigned int start_subdevice;

int
comedi_get_read_subdevice(device)
comedi_t *device;

int
comedi_get_write_subdevice(device)
comedi_t *device;

int
comedi_get_subdevice_flags(device, subdevice)
comedi_t *device;
unsigned int subdevice;

int
comedi_get_n_channels(device, subdevice)
comedi_t *device;
unsigned int subdevice;

int
comedi_range_is_chan_specific(device, subdevice)
comedi_t *device;
unsigned int subdevice;

int
comedi_maxdata_is_chan_specific(device, subdevice)
comedi_t *device;
unsigned int subdevice;

#/* lsampl_t */
lsampl_t
comedi_get_maxdata(device, subdevice, channel)
comedi_t *device;
unsigned int subdevice;
unsigned int channel;

int
comedi_get_n_ranges(device, subdevice, channel)
comedi_t *device;
unsigned int subdevice;
unsigned int channel;

#/* comedi_range * */
comedi_range *
comedi_get_range(device, subdevice, channel, range)
comedi_t *device;
unsigned int subdevice;
unsigned int channel;
unsigned int range;

int
comedi_find_range(device, subdevice, channel, unit, min, max)
comedi_t *device;
unsigned int subdevice;
unsigned int channel;
unsigned int unit;
double min;
double max;

int
comedi_get_buffer_size(device, subdevice)
comedi_t *device;
unsigned int subdevice;

int
comedi_get_max_buffer_size(device, subdevice)
comedi_t *device;
unsigned int subdevice;

int
comedi_set_buffer_size(device, subdevice, size)
comedi_t *device;
unsigned int subdevice;
unsigned int size;

#/* comedi_insnlist * */
int
comedi_do_insnlist(device, list)
comedi_t *device;
comedi_insnlist *list;

#/* comedi_insn * */
int
comedi_do_insn(device, instruction)
comedi_t *device;
comedi_insn *instruction;

int
comedi_lock(device, subdevice)
comedi_t *device;
unsigned int subdevice;

int
comedi_unlock(device, subdevice)
comedi_t *device;
unsigned int subdevice;

double
comedi_to_phys(data, range, maxdata)
lsampl_t data;
comedi_range *range;
lsampl_t maxdata;

lsampl_t
comedi_from_phys(data, range, maxdata)
double data;
comedi_range *range;
lsampl_t maxdata;

#/* lsampl_t * */
int
comedi_data_read(device, subdevice, channel, range, aref, data)
comedi_t *device;
unsigned int subdevice;
unsigned int channel;
unsigned int range;
unsigned int aref;
lsampl_t *data;

int
comedi_data_read_delayed(device, subdevice, channel, range, aref, data, ns)
comedi_t *device;
unsigned int subdevice;
unsigned int channel;
unsigned int range;
unsigned int aref;
lsampl_t *data;
unsigned int ns; #/* nanosec */

int
comedi_data_read_hint(device, subdevice, channel, range, aref)
comedi_t *device;
unsigned int subdevice;
unsigned int channel;
unsigned int range;
unsigned int aref;

int
comedi_data_write(device, subdevice, channel, range, aref, data)
comedi_t *device;
unsigned int subdevice;
unsigned int channel;
unsigned int range;
unsigned int aref;
lsampl_t data;

int
comedi_dio_config(device, subdevice, channel, direction)
comedi_t *device;
unsigned int subdevice;
unsigned int channel;
unsigned int direction;

int
comedi_dio_get_config(device, subdevice, channel, direction)
comedi_t *device;
unsigned int subdevice;
unsigned int channel;
unsigned int &direction;

int
comedi_dio_read(device, subdevice, channel, bit)
comedi_t *device;
unsigned int subdevice;
unsigned int channel;
unsigned int &bit;
   OUTPUT:
   bit

int
comedi_dio_write(device, subdevice, channel, bit)
comedi_t *device;
unsigned int subdevice;
unsigned int channel;
unsigned int bit;

int
comedi_dio_bitfield2(device, subdevice, write_mask, bits, base_channel)
comedi_t *device;
unsigned int subdevice;
unsigned int write_mask;
unsigned int &bits;
unsigned int base_channel;
   OUTPUT:
   bits

#/* comedi_cmd * */
int
comedi_get_cmd_src_mask(device, subdevice, command)
comedi_t *device;
unsigned int subdevice;
comedi_cmd *command;
   OUTPUT:
   command

#/* TODO: online func ref for this func is out of date! */
int
comedi_get_cmd_generic_timed(device, subdevice, command, chll, period_ns)
comedi_t *device;
unsigned int subdevice;
comedi_cmd *command;
unsigned int chll; #/* chanlist_len */
unsigned int period_ns;
   OUTPUT:
   command

int
comedi_cancel(device, subdevice)
comedi_t *device;
unsigned int subdevice;

int
comedi_command(device, command)
comedi_t *device;
comedi_cmd *command;

int
comedi_command_test(device, command)
comedi_t *device;
comedi_cmd *command;

int
comedi_poll(device, subdevice)
comedi_t *device;
unsigned int subdevice;

int
comedi_set_max_buffer_size(device, subdevice, max_size)
comedi_t *device;
unsigned int subdevice;
unsigned int max_size;

int
comedi_get_buffer_contents(device, subdevice)
comedi_t *device;
unsigned int subdevice;

int
comedi_mark_buffer_read(device, subdevice, num_bytes)
comedi_t *device;
unsigned int subdevice;
unsigned int num_bytes;

int
comedi_mark_buffer_written(device, subdevice, num_bytes)
comedi_t *device;
unsigned int subdevice;
unsigned int num_bytes;

int
comedi_get_buffer_offset(device, subdevice)
comedi_t *device;
unsigned int subdevice;
