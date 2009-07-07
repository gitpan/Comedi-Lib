# ------------------------------------------------
# Lib.pm - Copyright (C) 2K09 Manuel Gebele
# <forensixs@gmx.de, Germany
#
# vim: se nu ts=3 sw=3 tw=78 et sr
#
# ------------------------------------------------
package Comedi::Lib;
# ------------------------------------------------

use 5.008008;

use strict;
use warnings;

use Carp;

require Exporter;
our @ISA = qw(Exporter);

our %EXPORT_TAGS = ('all' => [qw(
   comedi_close
   comedi_open
   comedi_loglevel
   comedi_perror
   comedi_strerror
   comedi_errno
   comedi_fileno
   comedi_get_n_subdevices
   comedi_get_version_code
   comedi_get_driver_name
   comedi_get_board_name
   comedi_get_subdevice_type
   comedi_find_subdevice_by_type
   comedi_get_read_subdevice
   comedi_get_write_subdevice
   comedi_get_subdevice_flags
   comedi_get_n_channels
   comedi_range_is_chan_specific
   comedi_max_data_is_chan_specific
   comedi_get_maxdata
   comedi_get_n_ranges
   comedi_get_range
   comedi_find_range
   comedi_get_buffer_size
   comedi_get_max_buffer_size
   comedi_set_buffer_size
   comedi_do_insnlist
   comedi_do_insn
   comedi_lock
   comedi_unlock
   comedi_to_phys
   comedi_from_phys
   comedi_data_read
   comedi_data_read_delayed
   comedi_data_read_hint
   comedi_data_write
   comedi_dio_config
   comedi_dio_get_config
   comedi_dio_read
   comedi_dio_write
   comedi_dio_bitfield2
   comedi_get_cmd_src_mask
   comedi_get_cmd_generic_timed
   comedi_cancel
   comedi_command
   comedi_command_test
   comedi_poll
   comedi_set_max_buffer_size
   comedi_get_buffer_contents
   comedi_mark_buffer_read
   comedi_mark_buffer_written
   comedi_get_buffer_offset
)]);

our @EXPORT_OK = (@{$EXPORT_TAGS{'all'}});

our $VERSION = '0.01';

use AutoLoader;

sub AUTOLOAD {
   my $constname;
   our $AUTOLOAD;

   ($constname = $AUTOLOAD) =~ s/.*:://;
   if ($constname eq 'constant') {
      croak '&Comedi::Lib::constant not defined';
   }

   my ($error, $val) = constant($constname);
   croak $error if $error;

   {
      no strict 'refs';
      *$AUTOLOAD = sub { $val };
   }

   goto &$AUTOLOAD;
}

require XSLoader;
XSLoader::load('Comedi::Lib', $VERSION);

1;

__END__

=head1 NAME

Comedi::Lib - Perl API for Comedilib

=head1 SYNOPSIS

  use Comedi::Lib qw(:all);

  # Open the device
  my $device = comedi_open('/dev/comedi0');

  # Get the driver and the board name of the board
  my $driver_name = comedi_get_driver_name($device);
  my $board_name = comedi_get_board_name($device);

  print "Board name - $board_name\n";
  print "Driver name - $driver_name\n";

  # Close the device
  comedi_close($device);

=head1 DESCRIPTION

The Comedi::Lib module provides a Perl API for Comedilib.
Comedilib is a separately distributed package containing a
user-space library that provides a developer-friendly interface
to the comedi devices. This module consists of the functions
that the Comedilib library provides (wrapper).

=head1 DEPENDENCIES

This Interface is dependent on the Comedilib library. Please download
and install the latest version at http://www.comedi.org/.

The Comedilib library _must_ be found in your library path when using
this module. The library is defaultly installed in /usr/local/lib --
in this case, be sure that the /usr/local/lib path is in your
/etc/ld.so.conf.

=head2 EXPORT

None by default.

=head2 Exportable Functions

For a detailed description of each function see the Comedilib Function
Reference at http://www.comedi.org/doc/x4629.html#FUNCTIONREFERENCE

=item comedi_close

=item comedi_open

=item comedi_loglevel

=item comedi_perror

=item comedi_strerror

=item comedi_errno

=item comedi_fileno

=item comedi_get_n_subdevices

=item comedi_get_version_code

=item comedi_get_driver_name

=item comedi_get_board_name

=item comedi_get_subdevice_type

=item comedi_find_subdevice_by_type

=item comedi_get_read_subdevice

=item comedi_get_write_subdevice

=item comedi_get_subdevice_flags

=item comedi_get_n_channels

=item comedi_range_is_chan_specific

=item comedi_get_max_data

=item comedi_get_n_ranges

=item comedi_get_range

=item comedi_find_range

=item comedi_get_buffer_size

=item comedi_get_max_buffer_size

=item comedi_set_buffer_size

=item comedi_do_insnlist

=item comedi_do_insn

=item comedi_lock

=item comedi_unlock

=item comedi_to_phys

=item comedi_from_phys

=item comedi_data_read

=item comedi_data_read_delayed

=item comedi_data_read_hint

=item comedi_data_write

=item comedi_dio_config

=item comedi_dio_get_config

=item comedi_dio_read

=item comedi_dio_write

=item comedi_dio_bitfield2

=item comedi_get_cmd_src_mask

=item comedi_get_cmd_generic_timed

=item comedi_cancel

=item comedi_command

=item comedi_command_test

=item comedi_poll

=item comedi_set_max_buffer_size

=item comedi_get_buffer_contents

=item comedi_mark_buffer_read

=item comedi_mark_buffer_written

=item comedi_get_buffer_offset

=head1 SEE ALSO

Linux Comedi: http://www.comedi.org/

=head1 AUTHOR

Manuel Gebele, E<lt>forensixs[at]gmx.deE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009 by Manuel Gebele

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
