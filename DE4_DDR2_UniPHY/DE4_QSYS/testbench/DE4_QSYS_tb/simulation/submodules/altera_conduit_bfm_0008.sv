// (C) 2001-2013 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/main/ip/sopc/components/verification/altera_tristate_conduit_bfm/altera_tristate_conduit_bfm.sv.terp#7 $
// $Revision: #7 $
// $Date: 2010/08/05 $
// $Author: klong $
//-----------------------------------------------------------------------------
// =head1 NAME
// altera_conduit_bfm
// =head1 SYNOPSIS
// Bus Functional Model (BFM) for a Standard Conduit BFM
//-----------------------------------------------------------------------------
// =head1 DESCRIPTION
// This is a Bus Functional Model (BFM) for a Standard Conduit Master.
// This BFM sampled the input/bidirection port value or driving user's value to 
// output ports when user call the API.  
// This BFM's HDL is been generated through terp file in Qsys/SOPC Builder.
// Generation parameters:
// output_name:                                       altera_conduit_bfm_0008
// role:width:direction:                              read_buffer:1:output,buffer_output_data:32:input,data_available:1:input
// false
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ns

module altera_conduit_bfm_0008
(
   sig_read_buffer,
   sig_buffer_output_data,
   sig_data_available
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   output sig_read_buffer;
   input [31 : 0] sig_buffer_output_data;
   input sig_data_available;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic ROLE_read_buffer_t;
   typedef logic [31 : 0] ROLE_buffer_output_data_t;
   typedef logic ROLE_data_available_t;

   reg read_buffer_temp;
   reg read_buffer_out;
   logic [31 : 0] buffer_output_data_in;
   logic [31 : 0] buffer_output_data_local;
   logic [0 : 0] data_available_in;
   logic [0 : 0] data_available_local;

   //--------------------------------------------------------------------------
   // =head1 Public Methods API
   // =pod
   // This section describes the public methods in the application programming
   // interface (API). The application program interface provides methods for 
   // a testbench which instantiates, controls and queries state in this BFM 
   // component. Test programs must only use these public access methods and 
   // events to communicate with this BFM component. The API and module pins
   // are the only interfaces of this component that are guaranteed to be
   // stable. The API will be maintained for the life of the product. 
   // While we cannot prevent a test program from directly accessing internal
   // tasks, functions, or data private to the BFM, there is no guarantee that
   // these will be present in the future. In fact, it is best for the user
   // to assume that the underlying implementation of this component can 
   // and will change.
   // =cut
   //--------------------------------------------------------------------------
   
   event signal_input_buffer_output_data_change;
   event signal_input_data_available_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "13.0";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // read_buffer
   // -------------------------------------------------------

   function automatic void set_read_buffer (
      ROLE_read_buffer_t new_value
   );
      // Drive the new value to read_buffer.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      read_buffer_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // buffer_output_data
   // -------------------------------------------------------
   function automatic ROLE_buffer_output_data_t get_buffer_output_data();
   
      // Gets the buffer_output_data input value.
      $sformat(message, "%m: called get_buffer_output_data");
      print(VERBOSITY_DEBUG, message);
      return buffer_output_data_in;
      
   endfunction

   // -------------------------------------------------------
   // data_available
   // -------------------------------------------------------
   function automatic ROLE_data_available_t get_data_available();
   
      // Gets the data_available input value.
      $sformat(message, "%m: called get_data_available");
      print(VERBOSITY_DEBUG, message);
      return data_available_in;
      
   endfunction

   assign sig_read_buffer = read_buffer_temp;
   assign buffer_output_data_in = sig_buffer_output_data;
   assign data_available_in = sig_data_available;


   always @(buffer_output_data_in) begin
      if (buffer_output_data_local != buffer_output_data_in)
         -> signal_input_buffer_output_data_change;
      buffer_output_data_local = buffer_output_data_in;
   end
   
   always @(data_available_in) begin
      if (data_available_local != data_available_in)
         -> signal_input_data_available_change;
      data_available_local = data_available_in;
   end
   


// synthesis translate_on

endmodule


